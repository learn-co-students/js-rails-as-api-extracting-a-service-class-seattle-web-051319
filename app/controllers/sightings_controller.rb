class SightingsController < ApplicationController

    def index 
        @sightings = Sighting.all()

        @options = {inlude: {bird: {only: [:name, :species]},
        location: {only: [:longitude, :latitude]}},
        only: [:id, :bird_id, :location_id]}

        render json: @options.to_json();
    end
    def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    end
end
