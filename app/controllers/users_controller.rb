class UsersController < ApplicationController
  def index
		Rails.logger.info request.env["HTTP_COOKIE"]
		@users = User.all
	end
	
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create success!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:errors] = "#{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
