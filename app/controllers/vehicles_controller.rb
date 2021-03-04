class  VehiclesController < ApplicationController
    before_action :authenticate_user!
    def index
        @vehicles = Vehicle.all
    end

    def new
        @vehicle = Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            redirect_to vehicles_path(@vehicle)
        else
            render :new
        end
    end

    def vehicle_params
        params.require(:vehicle).permit(:name)
    end
end
