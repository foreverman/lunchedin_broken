 class WelcomeController < ApplicationController

  skip_before_filter :check_authentication, :only => [:index]

  def index
    # @comments = Comment.find(:all, :limit => 5, :order => 'created_at desc')
    @comments = Comment.order(created_at: :desc).limit(5)
    @tags = Tag.limit(25)
  end
  
end
