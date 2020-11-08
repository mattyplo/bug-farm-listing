class FarmsController < ApplicationController

  def show
    @farm = Farm.find(params[:id])
  end

  def index
    @farms = Farm.all
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(params.require(:farm).permit(:name, :description, :country, :website))
    if @farm.save
      flash[:notice] = "Farm was created successfully."
      redirect_to @farm
    else
      render 'new'
    end
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    if @farm.update(params.require(:farm).permit(:name, :description, :country, :website))
      flash[:notice] = "Farm was updated successfully."
      redirect_to @farm
    else
      render 'edit'
    end
  end

end