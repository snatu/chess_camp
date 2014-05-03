class StudentsController < ApplicationController

	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@student = Student.new
	end

	def edit
	end

	def create
		@student = Student.new(student_params)
		if @student.save 
			redirect_to @student, notice: "#{@student.name} was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @student.update(student_params)
			redirect_to @student, notice: "#{@student.name} was revised in the system"
		else
			render action: 'edit'
		end
	end

	def destroy
		@student.destroy
		redirect_to student_url
	end

	private

	def set_student
		@student = Student.find(params[:id])
	end

	def student_params
		params.require(:student).permit(:family_id, :first_name, :last_name, :date_of_birth, :rating, :active)
	end


end