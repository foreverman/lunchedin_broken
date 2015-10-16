 class RatingsController < ApplicationController
  def create
    @venue = Venue.find(params[:venue_id])
    @venue.ratings << Rating.new do |r| 
      r.score = params[:score]
      r.user_id = session[:user_id]
    end
  end
end
