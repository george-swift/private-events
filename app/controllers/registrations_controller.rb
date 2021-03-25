class RegistrationsController < ApplicationController

  def create
    # event = Event.find(params[:event_id])
    puts params
    registered = Registration.new(event_id: params[:event_id], user_id: current_user.id)
    if registered.save
      flash[:success] = 'Invitation sent!'
      redirect_to users_path(event_id: event_id)
    else
      flash.now[:danger] = 'Something is not right'
      redirect_to event_path(event)
    end
  end
end
