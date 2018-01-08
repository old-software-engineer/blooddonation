class ContactsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@contacts = Contact.all
	end

	def create
			@contact = Contact.new(contact_params)
			if @contact.save
        respond_to do |format|
        	format.json { render :json => {result: "contact was successfully created."}}
      	end
      else
      	respond_to do |format|
        	format.html { render :partial => "/contacts" }
        	format.json { render json: @contact.errors, status: :unprocessable_entity }
      	end
      end
	end

	def all_lat_longitude
		long_lat = Contact.all.as_json(only: [:longitude , :latitude])
		render :json => long_lat
	end

	private
	def contact_params
			params.require("contact").permit(:name,:email,:date_of_birth,:contact_number,:location,:blood_group,:age,:last_donated_at,:available_at_night,:available_from,:available_to,:longitude,:latitude)		
	end

end
