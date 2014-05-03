class FamiliesController < ApplicationController

  before_action: set_family, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @family = Family.new
  end

  def edit
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to @family, notice: "#{@family} was added to the system"
    else
      render action: 'new'
    end
  end

  def update
    if @family.update(family_params)
      redirect_to @family, notice: "#{@family} was revised in the system"
    else
      render action: 'edit'
    end
  end

  def destroy
    @family.destroy
    redirect_to location_url
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:family_name, :parent_first_name, :email, :phone, :active)
  end

end