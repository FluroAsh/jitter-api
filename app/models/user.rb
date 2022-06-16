class User < ApplicationRecord
  has_secure_password
  has_many :messages
  validates :username, :attributes, presence: true, uniqueness: true
  validates :email, :attributes, presence: true, uniqueness: true
end