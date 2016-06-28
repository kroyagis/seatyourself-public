class UsersController < ApplicationController
  layout "login_page"
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to restaurants_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(current_user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end


end
