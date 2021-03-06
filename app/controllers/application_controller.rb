class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if is_logged_in then
      User.find(session[:user_id])
    else
      nil
    end
  end

  def is_logged_in
    session.has_key?(:user_id) && session[:user_id].present?
  end
end
