class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def log_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def current_user
    return nil unless session[:session_token]
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def loggedin?
    !!current_user
  end

  # def require_login
  #   redirect_to unless loggedin?
  # end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end
end