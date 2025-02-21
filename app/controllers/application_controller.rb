class ApplicationController < ActionController::Base
  include Pundit
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

end
