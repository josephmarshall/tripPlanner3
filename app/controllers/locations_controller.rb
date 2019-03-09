class LocationsController < ApplicationController
before_action :set_trip
before_action :set_location, only: [:show, :edit, :update, :destroy]

  def show
    
  end
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to trip_location_path(@trip)
    else
    render partial: "form"
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip)
    else
      render partial: "form"
    end   
  end

  def destroy
    @location.destroy
    redirect_to trip_location_path(@trip)
  end

  private

  def location_params
    params.require(:location).permit(:name, :days, :trip_id)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_location
    @location = Location.find(params[:id])
  end

end


