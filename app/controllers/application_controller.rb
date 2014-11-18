class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	home_path
  end

  def after_sign_out_path_for(resource)
  	root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :access
    devise_parameter_sanitizer.for(:account_update) << :name << :access
  end
end
