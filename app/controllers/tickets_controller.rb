class TicketsController < ApplicationController
  before_action :set_train, except: :show
  before_action :set_ticket, only: :show

  def show; end

  def new
    @start_station = RailwayStation.find(params[:ticket][:start_station_id])
    @finish_station = RailwayStation.find(params[:ticket][:finish_station_id])
    @ticket = @train.tickets.new
  end

  def create
    @start_station = RailwayStation.find(params[:ticket][:start_station_id])
    @finish_station = RailwayStation.find(params[:ticket][:finish_station_id])
    @ticket = @train.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name, :second_name, :passport_number, :user_id, :start_station_id, :finish_station_id)
  end
end
