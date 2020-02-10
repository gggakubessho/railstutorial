class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      #default で @userはidを渡す
      #redirect_toはdefaultでuser_path(@user)を渡す
      redirect_to @user
      #=>GET user_path(@user)  => show
    else
      render 'new'
    end
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
