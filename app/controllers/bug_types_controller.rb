class BugTypesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @bug_types = BugType.paginate(page: params[:page], per_page: 5)
  end

  def show
    @bug_type = BugType.find(params[:id])
    @farms = @bug_type.farms.paginate(page: params[:page], per_page: 5)
  end

  def new
    @bug_type = BugType.new
  end

  def create
    @bug_type = BugType.new(bug_type_params)
    if @bug_type.save
      flash[:notice] = "Bug type was successfully created"
      redirect_to @bug_type
    else
      render 'new'
    end
  end

  def edit 
    @bug_type = BugType.find(params[:id])
  end

  def update
    @bug_type = BugType.find(params[:id])
    if @bug_type.update(bug_type_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @bug_type 
    else 
      render 'edit'
    end
  end

  private

  def bug_type_params
    params.require(:bug_type).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to bug_types_path
    end
  end
end