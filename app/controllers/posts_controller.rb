class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @posts = Post.all
  end

  def grid
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end
  
  # POST /posts
  def create
     @post = current_user.posts.new(post_params)
    # @post.user_id = current_user.id
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created'
      else
        render :new
      end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was deleted"
  end

  private
    # Use callbacks to share common setup or contraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end