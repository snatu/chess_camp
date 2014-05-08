class RegistrationsController < ApplicationController 
	
	def new
		@registration = Registration.new
	end

	def create
		@registration = Registration.new(registration_params)
		if @registration.save
			redirect_to camp_path(@registration.camp), notice: "#{@registration.student.proper_name} has been added to the system."
		else
			render nothing: new
		end
	end

	def destroy
		@registration.destroy
		redirect_to camp_path(camp_id), notice: "#{registration.student.proper_name} was unregistered for the camp"
	end

	private
	def registration_params
		params.require(:registration).permit(:camp_id, :student_id, :payment_status, :points_earned)
	end

end