class Post < ApplicationRecord
  belongs_to :blog
  validates :title, length: { minimum: 5 } 
  validates :content, length: { minimum: 10 } 
end
