class SessionController < ApplicationController

  skip_before_filter :check_authentication
  
  def index
    render :action => 'login'
  end
  
  
  def check_login
    if @user = User.where(         
        "username = '#{params[:user][:username]}' " +  
        "AND password = '#{params[:user][:password]}'").first
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      
      flash[:notice] = "the user #{params[:user][:username]}, "
      flash[:notice] << "was not found with the specified password"
      redirect_to '/login'
      
    end
  end
  

  def logout
    reset_session
  end
end
