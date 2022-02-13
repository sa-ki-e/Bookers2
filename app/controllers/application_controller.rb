class ApplicationController < ActionController::Base
  
  #ストロングパラメータ同様、データの保存ができるよう
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
