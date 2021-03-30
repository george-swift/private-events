#:NoDoc:
module EventsHelper
  def users_list(event_id, current_user)
    @users_list = User.all.where.not(id: Event.find_by(id: event_id).attendees.pluck(:id) << current_user.id)
  end

  def search_for(attendee)
    User.find(attendee.id).name
  end

  def upcoming?(event)
    event.date > Time.now
  end

  def options(event)
    event_path(id: event.id, users_list: true)
  end

  def query(event)
    registrations_path(event_id: event.id, guests_list: [current_user.id])
  end

  def register(users)
    render 'guest_list' if params.key?(users)
  end

  def truncate(text)
    text.truncate_words(12)
  end
end
