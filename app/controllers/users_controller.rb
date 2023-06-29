class UsersController < ApplicationController
	# before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def home
	end

	def create 
		@user = User.new(user_params)

		if @user.save
			CrudNotificationMailer.create_notification(@user).deliver_now
			redirect_to users_path
		else 
			render :new, status: :unprocessable_entity
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :user_name, :password, :password_confirmation)

end
