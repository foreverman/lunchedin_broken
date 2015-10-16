 class EventsController < ApplicationController

  def index
    new
    render :action => 'new'
  end
  
  def new
    @event = Event.new
  end
  
  
  def show
    @event = Event.find(params[:id])
  end
  
  
  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    @event.venue_id = params[:venue_id]
    if @event.save
      flash[:info] = "you are almost done organizing your event!"
      redirect_to event_path(@event)
    else
      render :action => 'new'
    end
  end
  
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render :action => 'show'
    end
  end
  
  
  def finished
    begin
      @event = @user.events.find(params[:id])
      @event.update_attribute(:status, 'organized')
      respond_to do |format|
        format.js
      end
    rescue
    end
  end

  protected
  def event_params
    params.require(:event).permit!
  end
end
