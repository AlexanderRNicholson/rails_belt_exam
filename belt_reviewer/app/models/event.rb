class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :attendees
  has_many :attendees
  has_many :comments, dependent: :destroy
end
