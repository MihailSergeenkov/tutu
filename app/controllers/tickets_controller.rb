class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:edit, :update]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:show, :destroy]

  def index
    @tickets = Ticket.find_tickets(current_user)
  end

  def show; end

  def new
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @finish_station = RailwayStation.find(params[:finish_station_id])
    @ticket = @train.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name, :second_name, :passport_number, :start_station_id, :finish_station_id, :train_id)
  end

  def check_admin
    redirect_to tickets_path, alert: 'У вас нет прав на это действие!' unless current_user.admin?
  end

  def check_owner
    redirect_to tickets_path, alert: 'У вас нет прав на это действие!' unless  current_user.admin? || @ticket.user == current_user
  end
end
