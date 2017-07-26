class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    logger.debug resource.inspect
    logger.debug prueba_path
    logger.debug params
    prueba_path
    #if resource_name == "user"
    #  prueba_path
    #end
  end

  def after_sign_out_path_for(resource_or_scope)
    logger.debug resource_or_scope.inspect
    if resource_or_scope == :user
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usuario, :password, :password_confirmation])
  end
end
