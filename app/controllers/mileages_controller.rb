class MileagesController < ApplicationController
  def index
    @mileages = Mileage.all
  end

  def show
  end

  def new
    @mileage = Mileage.new
    @vehicles = Vehicle.all
  end

  def create
    mileage = Mileage.new(mileage_params)
    @vehicle = Vehicle.find(params[:mileage][:vehicle_id])

    if mileage.save
      flash[:notice] = 'Mileage entry was successfully created'
      redirect_to @vehicle
    else
      redirect_to @vehicle
    end
  end

  private

  def mileage_params
    params.require(:mileage).permit(:vehicle_id, :miles, :gallons, :filled_tank_on)
  end
end
