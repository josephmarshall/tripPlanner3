class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :destroy]


  def index
    @address = @location.addresses
  end

  def show

  end

  def new
    @address = Address.new
    render partial: "form"
  end

  def create
    # binding.pry
    @address = Address.new(address_params)
    @address[:location_id] = @location[:id]
    if @address.save
      flash[:success] = "Address Created"
      redirect_to trip_path(@location[:trip_id])
    else
      render partial: "form"
    end

  end

  def edit
    render partial: "form"
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@location[:trip_id], @location[:id])
    else
      render partial: "form"
    end  
  end

  def destroy
    @address.destroy
    redirect_to trip_location_path(@location[:trip_id], @location[:id])
  end

  private 
  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :lat, :long, :location_id)
  end
end