class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :attempt]
  def login
    #Login Form
  end

  def signup
    @user = User.new
  end

  def attempt
    @current_user = User.authenticate(params[:username_or_email],params[:login_password])
    if @current_user
      session[:user_id] = @current_user.id
      @user = @current_user
      @user
      redirect_to root_path
    else
      @user = User.new
      render "signup"	
    end
  end

  def home
    
  end

  def profile
  end

  def setting
  end

  def logout
  session[:user_id] = nil
  redirect_to :action => 'login'
end
end
