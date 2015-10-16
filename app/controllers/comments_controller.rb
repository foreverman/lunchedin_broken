 class CommentsController < ApplicationController

  before_filter :check_authorization, :only => [:destroy]

  def destroy
    Comment.delete(params[:id])
    respond_to do |format|
      format.js do
        render :update do |page| 
          page.visual_effect :fade, "comment_#{params[:id]}"
        end
      end
    end
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @comment = @venue.comments.create({:user_id => session[:user_id]}.merge(comment_params))
    # respond_to do |format|
    #   format.js do
    #     render :update do |page| 
    #       page.insert_html :bottom, 'comments', :partial => 'comment', 
    #         :locals => {:comment => @comment}
    #       page.visual_effect :highlight, "comment_#{@comment.id}"
    #       page['comment_subject'].clear
    #       page['comment_body'].clear
    #     end
    #   end
    # end
  end
  
  protected
  def comment_params
    params.require(:comment).permit!
  end
  # TODO test this this check_auth method against chapter content
  def check_authorization
    unless @user and @user.role.name == 'admin'
      flash[:notice] = "Not authorized!"
      redirect_to root_path
    end
  end
end
