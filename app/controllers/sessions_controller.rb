class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user
      flash.now[:success] = 'Log in successful!'
    else
      flash.now[:danger] = 'Invalid name'
      render :new
    end
  end
end
