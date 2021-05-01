module RegistrationsHelper
  def not_registered?(user, id)
    Event.find(id).attendees.where(id: user.id).any?
  end

  def disable(user, id)
    'disabled' if Event.find(id).date < Time.now || not_registered?(user, id)
  end
end
