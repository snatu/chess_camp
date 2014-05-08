class StudentsController < ApplicationController
	authorize_resource
	#before_action :check_login, only: [:index, :show, :new, :edit, :create, :update, :destroy]
	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def index
		@active_students = Student.active.alphabetical.paginate(:page => params[:page]).per_page(10)
		@inactive_students = Student.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
	end

	def show
		authorize! :show, @student
		@camps_participated = @student.camps.past.chronological
	end

	def new
		@student = Student.new
	end

	def edit
	end

	def create
		@student = Student.new(student_params)
		if @student.save 
			redirect_to @student, notice: "#{@student.proper_name} was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @student.update(student_params)
			redirect_to @student, notice: "#{@student.proper_name} was revised in the system"
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