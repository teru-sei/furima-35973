class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configured_parmitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configured_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_ka, :first_name_ka, :birthday])
  end
end