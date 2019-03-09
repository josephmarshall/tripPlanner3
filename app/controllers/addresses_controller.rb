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
  end

  def create
    @address = @locations.addresses.new(address_params)

    if @address.save
      flash[:success] = "Address Created"
      redirect_to trip_path(@location[:trip_id])
    else
      flash[:error] = "Error #{@address.errors.full_messages.join("\n")}"
      render_error(@address)
    end

  end

  def edit
  end

  def destroy
    @address.destroy
    render json: { message: 'removed' }, status: :ok
  end

  private 
  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :lat, :long, :trip_id)
  end
end