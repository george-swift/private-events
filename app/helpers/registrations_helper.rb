module RegistrationsHelper
  def not_registered?(user, id)
    Event.find(id).attendees.where(id: user.id).any?
  end

  def disable(user, id)
    'disabled' if not_registered?(user, id)
  end
end
