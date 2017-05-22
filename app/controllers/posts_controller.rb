class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
  end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post deleted' }
      format.json { head :no_content }
    end
  end

  private
		def post_params
			params.require(:post).permit(:title,:message, :schedeled_at,:avatar_url)
		end
end
