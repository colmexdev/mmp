class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end


  protected
  def after_sign_in_path_for(resource)
    prueba_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usuario, :password, :password_confirmation])
  end
end
