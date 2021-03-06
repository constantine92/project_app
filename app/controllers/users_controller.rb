class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params) #not final implementation
    if @user.save
      flash[:success] = "Welcome to the Sample App! Hope you continue learning :)"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
    
  end
  
end
