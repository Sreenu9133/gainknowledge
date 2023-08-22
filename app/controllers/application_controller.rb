class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to courses_url, :alert => exception.message
  end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role_ids, :user_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role_ids, :user_name])
      # # user_params.permit(:role_id)
    end
  end

