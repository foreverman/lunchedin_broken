class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.event_id = params[:event_id]
    @attendee.save
  end
  
  def destroy
    if Attendee.delete(params[:id])
      respond_to do |format|
        format.js do
          render :update do |page|
            page.visual_effect :fade, "attendee_#{params[:id]}"
          end      
        end
      end
    end
  end
  private
  def attendee_params
    params.require(:attendee).permit!
  end

end

