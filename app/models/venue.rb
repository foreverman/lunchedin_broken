class Venue < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, :as => :commentable
  has_many :ratings

  
  validates_presence_of :name, :address_one, :city, :state, :zip_code
  validates_length_of :zip_code, :is => 5
  
  def tag(name)
    Tag.find_or_create_by(name: name).on(self) unless name.empty?
  end
  
  def rating
    Rating.average(:score, :conditions => ["venue_id = ?", id])
  end
  
  def positive_ratings
    Rating.count(:conditions => ["venue_id = ? and score > 0", id])
  end
    
  def has_user_rated?(user_id)
    ratings.each do |r|
      return true if user_id == r.user_id
    end
    return false
  end
end
