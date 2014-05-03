class RegistrationsController < ApplicationController 

	before_action :set_registration, only: [:edit, :update, :destroy]

	def new
		@registration = Registration.new
	end

	def edit
	end

	def create
		@registration = Registration.new(registration_params)
		if @registration.save
			redirect_to camp_path(@registration.camp_id), notice: "#{registration.student.proper_name} has been added to the system."
		else
			render action: 'new'
		end
	end

	def update
		if @registration.update(registration_params)
			redirect_to camp_path(@registration.camp_id), notice: "#{registration.student.proper_name} has been updated in the system."
		else
			render action: 'edit'
		end
	end

	def destroy
		@registration.destroy
		redirect_to camp_path(camp_id), notice: "#{registration.student.proper_name} was unregistered for the camp"
	end

	private
	def set_registration
		@registration = Registration.find(params[:id])
	end

	def registration_params
		params.require(:registration).permit(:camp_id, :student_id, :payment_status, :points_earned)
	end

end