class Tag < ActiveRecord::Base
  has_and_belongs_to_many :venues
  
  validates_uniqueness_of :name
  
  def on(dest)
    dest.tags << self
  end
end
