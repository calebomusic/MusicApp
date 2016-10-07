class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    current_user ? true : false
  end

  def authenticate
    unless logged_in?
      redirect_to new_user_url
    end
  end
  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    user.save
  end

  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
end
