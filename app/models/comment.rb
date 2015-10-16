class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates_presence_of :subject, :body, :commentable_id
end
