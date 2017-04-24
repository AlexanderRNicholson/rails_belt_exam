class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :events_attended, through: :attendees, source: :event
  has_many :attendees
  has_many :comments, dependent: :destroy
  
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
