class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @farms = Farm.paginate(page: params[:page], per_page: 5)
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user
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
    params.require(:farm).permit(:name, :description, :website, :country, bug_type_ids: [])
  end

  def require_same_user
    if current_user != @farm.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own farm listing"
      redirect_to @farm 
    end
  end
end