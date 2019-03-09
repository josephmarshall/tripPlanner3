class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :destroy]


  def index
    binding.pry
    @address = @location.addresses
    # render json: @list.tasks
  end

  def show

  end

  def new
    @address = Address.new

    # this stores the previous url, 
    # which allows the user to navigate back to the previous page
    # from wherever they originally navigated to the create new address
    # $previous_url = request.referer 
  end

  def create
    @address = @locations.addresses.new(address_params)

    if @address.save
      flash[:success] = "Address Created"
      render json: @address
    else
      flash[:error] = "Error #{@address.errors.full_messages.join("\n")}"
      render_error(@address)
    end

  end

  def edit
    # $previous_url = request.referer
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
    params.require(:address).permit(:street, :city, :state, :zip, :lat, :long)
  end
end