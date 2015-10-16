class User < ActiveRecord::Base
  validates_presence_of :email, :first_name, :last_name, :username, :password
  validates_uniqueness_of :username
  validates_length_of :zip_code, :is => 5
  validates_numericality_of :zip_code
  validates_confirmation_of :password
  has_many :events
  has_many :comments, :as => :commentable
  belongs_to :role
end
