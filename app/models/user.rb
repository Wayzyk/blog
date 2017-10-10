class User < ActiveRecord::Base
  validates :name, :email, :password_digest, presence: true
  validates :password, confirmation: true
  validates :email, :uniqueness => { :case_sensitive => false }
  has_many :posts
  has_many :comments
  has_secure_password
  mount_uploader :avatar, AvatarUploader
end
