class HomeController < ApplicationController
	#load_and_authorize_resource 
	before_action :find_user, only: [:destroy]
	before_action :authenticate_user!, except:[:index]
	 respond_to :json
	def index
		
	end

	def show
		if current_user.role.present?
			@users=User.all
			render component: 'Home', props: { data: @users }
		else
			@user=current_user
			render component: 'Home', props: { data: @user }
		end	
	end

	def destroy
		respond_to do |format|
		    if @user.destroy
		    	format.json  { render :json =>{result: "User was successfully deleted"}}
		    else
		    	format.json { render json: @user.errors, status: :unprocessable_entity }
		    end
		end
	end

	def update
		@user= User.find(params[:users][:id])
		respond_to do |format|
			if @user.update_attributes(users_params)
				#respond_with @user, json: @user
				format.json  { render :json =>{result: "User was Update successfully"}}
			else
			    format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

	def users_params
		params.require("users").permit(:name,:email,:date_of_birth,:contact_number,:location,:blood_group,:age,:last_donated_at,:available_at_night,:availbility_period)
	end
end
