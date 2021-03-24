class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user
      @user.save
      log_in @user
      flash[:success] = 'Welcome to Private Events'
      redirect_to @user
    else
      render :new
      flash[:danger] = 'Invalid signup details'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
