class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  #render layout: false
  def create
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
      #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json  { render :json =>{result: "User was successfully created.","redirect":true,"redirect_url": root_path}}
      else
        format.html { render :partial => "/home" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   debugger
  # end

  # DELETE /resource
  

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    #super(resource)
      home_path
  end

  private
  def users_params
    params.require("users").permit(:name,:email,:date_of_birth,:contact_number,:location,:blood_group,:age,:last_donated_at,:available_at_night,:availbility_period,:password)
  end
  


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
