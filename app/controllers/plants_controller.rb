class PlantsController < ApplicationController
    wrap_parameters formart:[]
#get plants
    def index
     plants=Plant.all
     render json:plants 
    end
#get plants by id
    def show
     plant=Plant.find_by(id: params[:id])
     if plant
     render json:plant, status: :created
        
    else
       render json: {error: 'Plant not found'},status: :not_found
    end
    end

    #create a new plant
    def create
        plant = Plant.create(plants_params)
        render json: plant, status: :created
    end

    private

    def plants_params 
        params.permit(:name, :image, :price)
    end
end
