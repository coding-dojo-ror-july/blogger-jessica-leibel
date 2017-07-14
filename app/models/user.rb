class User < ApplicationRecord
  has_secure_password
  has_one :blog
  validates :username, uniqueness: true
end
