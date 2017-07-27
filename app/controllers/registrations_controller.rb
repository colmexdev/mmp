class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]

  def new
    super
  end

  def create
    logger.debug sign_up_params
    build_resource(sign_up_params)
    respond_to do |format|
      if resource.save
        logger.debug @user.errors
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        logger.debug @user.errors
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    super
  end
end 
