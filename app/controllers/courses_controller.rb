class CoursesController < ApplicationController
	# load_and_authorize_resource
	def index
		@Courses = Course.all
	end 

	def show
		# @courses = Course.paginate(page: params[:page], per_page: 5)
		@course = Course.find_by_id(params[:id])
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		CrudNotificationMailer.create_notification(@course).deliver_now
		if @course.save
			redirect_to courses_path
		else
			render :new, status: :unprocessable_entity
		end
	end 

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			redirect_to course_url, notice: "Course is successfully created!!"
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to root_path, status: :see_other
	end

	def about
	end

	private
	def course_params
		params.require(:course).permit(:course_name, :course_details, :course_duration, :category_id)
	end
end
