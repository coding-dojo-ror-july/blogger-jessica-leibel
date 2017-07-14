class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :title, length: { minimum: 5 } 
end
