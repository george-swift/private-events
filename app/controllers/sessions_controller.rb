class SessionsController < ApplicationController
  before_action :session_state, only: [:new]

  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      flash[:success] = 'Log in successful!'
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid name'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_state
    flash[:warning] = "You are already signed in, #{current_user.name}" if logged_in?
    redirect_to current_user if logged_in?
  end
end
