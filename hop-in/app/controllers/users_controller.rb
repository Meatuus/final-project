class UsersController < ApplicationController

  def index

  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private
  def user_params()
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :date_of_birth)
  end
end