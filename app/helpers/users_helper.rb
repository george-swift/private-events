module UsersHelper
  def long_format(date)
    date.to_formatted_s(:long_ordinal)
  end

  def short_format(date)
    date.to_formatted_s(:short)
  end

  def upcoming_events(user)
    user.attended_events.upcoming
  end

  def past_events(user)
    user.attended_events.previous
  end
end
