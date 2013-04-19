class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private

  def require_login
  	unless logged_in?
  		flash[:error] = "You must login first!"
  		redirect_to root_path
  	end
  end

  def current_user
  	@user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end
end
