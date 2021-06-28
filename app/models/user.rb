class User < ApplicationRecord
  has_many :blogs
  has_many :favorites, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  before_validation { email.downcase! }
  has_secure_password
end
