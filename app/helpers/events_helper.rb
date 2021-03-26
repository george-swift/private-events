#:NoDoc:
module EventsHelper
  def users_list(event_id, current_user)
    @users_list = User.all.where.not(id: Event.find_by(id: event_id).attendees.pluck(:id) << current_user.id)
  end
end
