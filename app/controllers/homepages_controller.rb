class HomepagesController < ApplicationController
  # GET /homepages
  # GET /homepages.xml
  def index
  @total = Post.count
  @index = rand(@total)+1
  @post = Post.find(@index)
    render :action => "index"
  end
  
end