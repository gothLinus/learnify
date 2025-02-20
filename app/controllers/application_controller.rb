class ApplicationController < ActionController::Base
  # before_action :check_authentication, unless: -> { session[:checked_authentication] }
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  private
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end
  private
  #def check_authentication
  #unless user_signed_in?
  #session[:checked_authentication] = true
  #new_user_session_path
  #end
  #end
end
