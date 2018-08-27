class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_user_logged_in
    unless logged_in?
    redirect_to("/sessions/new")
    end
  end

end