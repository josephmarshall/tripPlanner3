class LocationsController < ApplicationController
before_action :set_trip
  def index
    @locations = @trip.locations
  end
  
  private

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  
end


