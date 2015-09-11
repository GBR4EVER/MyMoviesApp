class Review < ActiveRecord::Base
  
  # Before the email is saved to the database, it will make the email downcase regardless of user input.
  before_save { self.email = email.downcase }
  
  validates :author, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 200 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
                                    
end