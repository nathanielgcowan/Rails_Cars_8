class CarsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :highest_rating]

    def index
        @cars = Car.all
        @new_cars = Car.new_car
        @old_cars = Car.old_car
        @trucks = Car.truck
        @cars_list = Car.car
        @vans = Car.van
    end

    def highest_rating
        @cars = Car.all
        @good_car = Car.good_car
        @good_new_cars = Car.good_new_cars
        @good_old_cars = Car.good_old_cars
        @best_cars = Car.best_cars
        @best_vans = Car.best_vans
        @best_trucks = Car.best_trucks
    end

    def new
        @car = Car.new
    end

    def create
        vehicle = Vehicle.find_or_create_by(name: params[:car][:vehicle_name])
        @car = current_user.cars.build(car_params)
        if @car.save
            redirect_to car_path(@car)
        else
            render :new
        end
    end

    def show
        @car = Car.find(params[:id])
        @part = @car.parts.build
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        @car.update(car_params)
        if @car.save
            redirect_to car_path(@car)
        else
            render :edit
        end
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        flash[:notice] = "Car deleted."
    end

    def car_params
        params.require(:car).permit(:make,:model,:year, :vehicle_name, :rating, parts_attributes: [:id, :name])
    end
end