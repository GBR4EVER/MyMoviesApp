class Movie < ActiveRecord::Base
    
  has_many :reviews
  
  validates :moviename, presence: true, length: { minimum: 3, maximum: 50 },
                                        uniqueness: { case_sensitive: false }
  
  validates :genre, presence: true, length: { minimum: 5, maximum: 50 }
  
  
end
