class Event < ApplicationRecord
  has_many :registrations
  has_many :attendees, through: :registrations, source: :user


  belongs_to :creator, class_name: 'User', foreign_key: "user_id"


end
