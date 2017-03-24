class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
    render @carriage.type.underscore.to_sym
  end

  def new
    @carriage = Carriage.new
  end

  def edit
    render "edit_#{@carriage.type.underscore}".to_sym
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to carriage_path(@carriage)
    else
      render :new
    end
  end

  def update
    if @carriage.update(send("#{@carriage.type.underscore}_params".to_sym))
      redirect_to carriage_path(@carriage)
    else
      render "edit_#{@carriage.type.underscore}".to_sym
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end

  def seat_carriage_params
    params.require(:seat_carriage).permit(:number, :type, :train_id, :seats)
  end

  def business_carriage_params
    params.require(:business_carriage).permit(:number, :type, :train_id, :bottom_seats)
  end

  def economy_carriage_params
    params.require(:economy_carriage).permit(:number, :type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats)
  end
  def coupe_carriage_params
    params.require(:coupe_carriage).permit(:number, :type, :train_id, :top_seats, :bottom_seats)
  end
end
