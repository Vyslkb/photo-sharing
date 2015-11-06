class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :about
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:about, :current_password) 
    }
  end

  # rescue_from ActionController::RoutingError, :with => :render_not_found
  # rescue_from StandardError, :with => :render_server_error

  # protected
  #   def render_not_found
  #     render "shared/404.html", :status => 404
  #   end

  #   def render_server_error
  #     render "shared/500.html", :status => 500
  #   end




end
