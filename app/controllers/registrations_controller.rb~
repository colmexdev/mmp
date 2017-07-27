class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    respond_to do |format|
      if resource.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    super
  end
end 
