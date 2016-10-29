class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper ApplicationHelper

  protected

  def current_user
    helpers.current_user
  end

  def require_user!
    unless current_user
      redirect_to login_path, flash: {error: "Only authorized users could have access. Please log in."}
    end
  end

  def public_only!
    if current_user
      redirect_to root_path, flash: {notice: "Already logged in. "}
    end
  end
end
