class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  def index
    if params[:make]
      @cars = Car.where(make: params[:make])
    else
      @cars = Car.all
    end
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    render json: 'Deletado com sucesso'
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end


    def car_params
      params.require(:car).permit(:model, :make, :year, :color, :board)
    end
end
