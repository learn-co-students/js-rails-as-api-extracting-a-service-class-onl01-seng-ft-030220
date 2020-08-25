class SightingsController < ApplicationController
    def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    end

    def show
        sighting = Sighting.find_by_id(params[:id])
        render json: SightingSerializer.new(sighting.to_serialized_json)
    end
    
end
