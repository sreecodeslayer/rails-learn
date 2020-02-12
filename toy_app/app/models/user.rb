class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {self.email = self.email.downcase}

  has_many :microposts
  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, length: {maximum: 250},
  format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  has_secure_password
end
