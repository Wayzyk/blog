class Comment < ActiveRecord::Base
  acts_as_votable

  validates  :body, presence: true
  belongs_to :post
  belongs_to :user
  has_ancestry
end
