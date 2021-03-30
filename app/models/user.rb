class User < ApplicationRecord
  has_many :registrations
  has_many :attended_events, through: :registrations, source: :event

  has_many :events, inverse_of: :creator
  validates :name, uniqueness: true, presence: true
end
