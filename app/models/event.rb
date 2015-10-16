class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :hosted_by, :foreign_key => "user_id", :class_name => "User"
  has_many :comments, :as => :commentable
  has_many :attendees
  
  validates_presence_of :status, :user_id, :venue_id, :occurs_on, :name
end
