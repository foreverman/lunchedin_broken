class UsersController < ApplicationController

  skip_before_filter :check_authentication, :only => [:index, :new, :create]

  def new
    @hide_tabs = true
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @hide_tabs = true    
    @user = User.new(user_params)  
    if @user.save  
      flash[:notice] = 'your account was successfully created.'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :action => 'new'
    end    
  end

  def user_params
    params.require(:user).permit!
  end
end
