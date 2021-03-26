class RegistrationsController < ApplicationController

  def create

    event = Event.find(params[:event_id])
    users_invited = params[:invited_users]
    errors = []

    users_invited.each do |attendee|

      registered = Registration.new(event_id: event.id, user_id: attendee)

      if registered.save
      else
        errors << attendee
      end
      end

    if errors.size > 0
      flash.now[:danger] = 'This erorr will never pop up'
    else
      flash.now[:success] = 'All users have been invited'
    end

    redirect_to event_path(event)
  end
end
