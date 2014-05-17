class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def home
    @user = User.new
  end

  def create
  	@user = User.where(:email => params[:session][:email]).first
  
    if @user == nil || !@user.authenticate(params[:session][:password])
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	else
  		flash[:success] = "You have logged in successfully"
  		session[:remember_token] = @user.id.to_s
  		@current_user = @user
  		redirect_to home_sessions_path
  	end
  end

  def destroy
  	session.delete(:remember_token)
  	redirect_to home_sessions_path
  end
end

#   if params[:session][:email].present? ----- Jen's way
  #     @user = User.find_or_create_by(email: parmas[:session][:email])
  #     if @user == nil || !@user.authenticate(params[:session][:password])
  #       flash[:danger] = "Invalid email/password combination"
  #     render 'new'
  #   else
  #     flash[:success] = "You have logged in successfully"
  #     session[:remember_token] = @user.id
  #     @current_user = @user
  #     redirect_to :root
  #   end
  # end