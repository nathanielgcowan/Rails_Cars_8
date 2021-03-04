class PartsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        if params[:car_id]
            @parts = Car.find(params[:car_id]).parts
        else
            @parts = Part.all
        end
    end

    def show
        @part = Part.find(params[:id])
    end

    def new
        if params[:car_id] && !Car.exists?(params[:car_id])
            redirect_to cars_path, alert: "Car not found."
        else
            @part = Part.new(car_id: params[:car_id])
        end
    end

    def create
        @part = current_user.parts.build(part_params)
        if @part.save
            redirect_to car_part_path(@part, @part)
        else
            flash.alert = "Fill out a valid ."
            render :new
        end
    end
    def edit
        if params[:car_id]
            car = Car.find_by(id: params[:car_id])
            if car.nil?
                redirect_to cars_path, alert: "Car not found."
            else
                @part = car.parts.find_by(id: params[:id])
                redirect_to car_parts_path(car), alert: "Part not found." if @part.nil?
            end
        else
            @part = Part.find(params[:id])
        end
    end

    def update
        @part = Part.find(params[:id])
        @part.update(part_params)
        if @part.save
            redirect_to part_path
        else
            render :edit
        end
    end

    def destroy
        @part = Part.find(params[:id])
        @part.destroy
        flash[:notice] = "Part deleted."
        redirect_to root_path
    end

    def part_params
        params.require(:part).permit(:name, :car_id, :user_id, :rating)
    end
end
