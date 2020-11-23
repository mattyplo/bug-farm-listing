class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    # The double exclamation marks turn the current_user method / variable into a boolean
    !!current_user
  end
end
