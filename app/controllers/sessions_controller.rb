class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.where(:email => params[:session][:email]).first

  	if @user == nil || !@user.authenticate(params[:session][:password])
  		flash[:danger] = "Invalid email/password combination"
  		render 'new'
  	else
  		flash[:success] = "You have logged in successfully"
  		session[:remember_token] = @user.id
  		@current_user = @user
  		redirect_to :root
  	end
  end

  def destroy
  	session.delete(:remember_token)
  	redirect_to :root
  end
end
