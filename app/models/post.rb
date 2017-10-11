class Post < ActiveRecord::Base
  acts_as_votable

  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, :presence => {:message => "Заголовок не может быть пустым"}
  validates_length_of :title, :minimum => 1, :maximum => 80
  validates :body, :presence => {:message => "Не может быть пустым"}
end
