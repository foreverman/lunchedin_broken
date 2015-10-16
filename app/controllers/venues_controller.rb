class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :action => 'new'
    end
  end
  
  def tag
    @venues = Tag.find(params[:id]).venues
    render :action => 'index'
  end

  def venue_params
    params.require(:venue).permit!
  end
end
