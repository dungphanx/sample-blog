class SessionsController < ApplicationController
  def new
  end
  
  def create
    if @user = User.find_by(email: params[:email].downcase)
      if @user.authenticate(params[:password])
        flash[:success] = "Welcome #{@user.name}"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:errors] = "Wrong password"
        render 'new'
      end
    else
      flash[:errors] = "Please enter email and password"
      render 'new'
    end
  end
end
