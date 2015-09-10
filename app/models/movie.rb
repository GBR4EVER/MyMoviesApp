class Movie < ActiveRecord::Base
    
  validates :moviename, presence: true, length: { minimum: 3, maximum: 50 }
  validates :genre, presence: true, length: { minimum: 5, maximum: 50 }
  
end
