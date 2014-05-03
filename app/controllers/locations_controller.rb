class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "#{@location.name} was added to the system"
    else
      render action: 'new'
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: "#{@location.name} was revised in the system"
    else 
      render action: 'edit'
    end
  end

  def destroy
    @location.destroy
    redirect_to location_url
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :street_1, :street_2, :city, :state, :zip, :max_capacity, :latitude, :longitude, :active)
  end

end