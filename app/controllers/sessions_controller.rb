class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Invalid Credentials Try Again"
      render :new
    end
  end

  def destroy
    session.clear
    flash.now[:logout] = "Goodbye!"
    render :new
  end
end
