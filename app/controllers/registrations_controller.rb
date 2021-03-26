class RegistrationsController < ApplicationController

  def create

    event = Event.find(params[:event_id])
    users_invited = params[:guests_list].compact
    errors = []

    users_invited.each do |attendee|
      registered = Registration.new(event_id: event.id, user_id: attendee)
      errors << attendee unless registered.save
    end

    if errors.size.positive?
      flash.now[:danger] = 'This erorr will never pop up'
    else
      flash.now[:success] = 'All users have been invited'
    end

    redirect_to event_path(event)
  end
end
