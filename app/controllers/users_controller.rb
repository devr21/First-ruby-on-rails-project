class UsersController < ApplicationController
	before_filter :authenticate_user, :only => [ :show]
	def create
		@user = User.new(parameters)

		if @user.save
			redirect_to articles_path
		else
			redirect_to "sessions#signup"
		end
	end

	def show
		@user = User.find(params[:id])
	end

  def parameters
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end
