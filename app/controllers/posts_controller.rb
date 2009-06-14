class PostsController < ApplicationController
    
    before_filter :load_user
    before_filter :login, :only => [:new, :edit, :destroy]
    before_filter :check_permission, :only => [:edit, :destroy]
    
    def login
      if logged_in?
      else
        redirect_back_or_default('/')
        flash[:notice] = 'Please log in.'  
      end
    end
        
    def check_permission
      @post = Post.find(params[:id])
      if logged_in?
        if @post.user_id == current_user.id
        else
          redirect_back_or_default('/')
          flash[:notice] = 'You must be the author to edit or destroy this post.'
        end
      end
    end
    
    def load_user
      @user = self.current_user
    end
    
  # GET /posts
  # GET /posts.xml
  def index
    
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts.paginate :page => params[:page], :per_page => 5
    
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @posts }
        end
    else
       @posts = Post.paginate :page => params[:page], :per_page => 5
    
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @posts }
        end
    end
    
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
   
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = @user.posts.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @post }
        end
  end

  # GET /posts/1/edit
  def edit
    @post = @user.posts.find(params[:id])
    
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @post }
        end
  end
  
  def create
    @post = @user.posts.build(params[:post])
    @post[:user_id] = current_user.id
    
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to([@user, @post]) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
    
    
  end
 # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = @user.posts.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to([@user, @post]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = @user.posts.find(params[:id])
     @post.destroy
      
      respond_to do |format|
        format.html { redirect_to(user_posts_url(@user)) }
        format.xml  { head :ok }
        end
  end

end
