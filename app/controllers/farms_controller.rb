class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @farms = Farm.all
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      flash[:notice] = "Farm was created successfully."
      redirect_to @farm
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @farm.update(farm_params)
      flash[:notice] = "Farm was updated successfully."
      redirect_to @farm
    else
      render 'edit'
    end
  end

  def destroy
    @farm.destroy
    redirect_to farms_path
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :description, :website, :country)
  end
  
end