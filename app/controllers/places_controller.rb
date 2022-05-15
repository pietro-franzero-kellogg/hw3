class PlacesController < ApplicationController

    def index
        @places = Place.all
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.new
        @place["name"] = params["place"]["name"]
        @place.save
        redirect_to "/places"
    end
end
