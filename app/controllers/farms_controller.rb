class FarmsController < ApplicationController

  def show
    @farm = Farm.find(params[:id])
  end

end