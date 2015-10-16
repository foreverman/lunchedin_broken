class Rating < ActiveRecord::Base
  validates_presence_of :user_id, :score
end
