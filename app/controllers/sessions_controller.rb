class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Login successfully!'
        redirect_to root_path
      else
        flash[:error] = 'Incorrect password'
        render 'new'
      end
    else
      flash[:error] = 'User not found with email ' + params[:email]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logout successfully!'
    redirect_to root_path
  end

end
