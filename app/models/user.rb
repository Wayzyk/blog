class User < ActiveRecord::Base
  validates_length_of :name, :minimum => 3, :message => "Слишком короткое имя (минимум 3 символа)"
  validates_length_of :password, :minimum => 6, :message => "Слишком короткий пароль (минимум 6 символов)"
  validates :name, :uniqueness => { :case_sensitive => false, :message => "Это имя уже занято. Попробуйте другое."}
  validates :name, :presence => { :message => "Имя не может быть пустым" }
  validates :email, :presence => { :message => "Почта не может быть пустая" }
  validates :password_digest , :presence => { :message => "Пароль не может быть пустым" }
  validates :password, :confirmation => { :message => "Пароли не совпадают"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , :message => "Неверный формат почты (пример: example@mail.com)"
  validates :email, :uniqueness => { :case_sensitive => false, :message => "Данная почта уже занята. Попробуйте другую"}

  has_secure_password

  has_many :posts
  has_many :comments

  mount_uploader :avatar, AvatarUploader
end
