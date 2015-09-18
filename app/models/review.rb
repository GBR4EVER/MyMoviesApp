class Review < ActiveRecord::Base
  
  belongs_to :movie
  
  # Before the email is saved to the database, it will make the email downcase regardless of user input.
  before_save { self.email = email.downcase }
  
  validates :movie_id, presence: true
  validates :author, presence: true, length: { minimum: 2, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  
                                    
end