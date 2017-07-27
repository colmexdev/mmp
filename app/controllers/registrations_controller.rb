class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    logger.debug resource
    logger.debug resource.methods
    respond_to do |format|
      if resource.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        logger.debug
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    super
  end
end 
