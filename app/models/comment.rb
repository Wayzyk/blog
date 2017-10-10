class Comment < ActiveRecord::Base
  validates  :body, presence: true
  belongs_to :post
  belongs_to :user
  has_ancestry
end
