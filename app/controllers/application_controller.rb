class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_filter :check_authentication, :except => [ :logout ]


  def check_authentication
    if session[:user_id]
      begin
        @user = User.find(session[:user_id])
        logger.debug "found user"
        return
      rescue
        reset_session
        redirect_to :controller => "session", action: 'index' and return
      end
    end
    redirect_to :controller => "session"
  end
end
