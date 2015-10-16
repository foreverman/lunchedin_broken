class TagsController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @venue.tag(params[:tag])
  end
  
end
