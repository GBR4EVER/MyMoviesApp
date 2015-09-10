class Review < ActiveRecord::Base
  
  validates :author, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 200 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
end