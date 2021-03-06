class User < ApplicationRecord   
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :farms, dependent: :destroy
  validates :username, presence: true,
                      uniqueness: { case_sensitive: true },
                      length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
end