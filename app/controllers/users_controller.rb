class UsersController < ApplicationController
	before_filter :authenticate_user, :only => [ :show, :index]
	def create
		@user = User.new(parameters)

		if @user.save
			redirect_to root_path
		else 
			render :template => 'sessions/signup'
		end
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

  def parameters
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end
