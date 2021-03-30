class RegistrationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    users_invited = params[:guests_list]

    if users_invited.all?(&:blank?)
      flash[:warning] = 'Invitations will be available with more users'
      redirect_to event_path(event)
    else
      users_invited.each do |attendee|
        registered = Registration.new(event_id: event.id, user_id: attendee)
        registered.save
      end

      flash[:success] = 'Selected guest(s) successfully added to attendees!'
      redirect_back(fallback_location: event_path(event))
    end
  end
end
