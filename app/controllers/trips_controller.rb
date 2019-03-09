class TripsController < ApplicationController
  def index
    @location = Trip.find(1).locations.find(1)
    @address = Trip.find(1).locations.find(1).address
  end

  def show
  end


end
