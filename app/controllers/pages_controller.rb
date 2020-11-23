class PagesController < ApplicationController
  def home
    redirect_to farms_path if logged_in?
  end

  def about

  end
end
