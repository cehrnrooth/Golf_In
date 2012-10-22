class Player < ActiveRecord::Base
  
  attr_accessible  :company, 
                   :email,
                   :industry,
                   :location,
                   :handicap,
                   :home_course,
                   :schedule
                       
  before_save { |player| player.email = email.downcase }
    
  validates :linkedin_id, presence: true, uniqueness: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
