class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: [:new, :create]
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @carriage = @train.carriages.new
  end

  def edit; end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to admin_carriage_path(@carriage.becomes Carriage)
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_carriage_path(@carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_url
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id]).becomes Carriage
  end

  def carriage_params
    params.require(:carriage).permit(:number, :type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
