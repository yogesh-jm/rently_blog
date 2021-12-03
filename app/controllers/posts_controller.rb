class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
        render json: @post
    else
        render error: { error: 'Unable to create Post.'}, status: 400
    end   
  end

  def index
    @posts = Post.all
    render json: @posts
  end  

  def show
    @post = Post.find(params[:id])
    render json: @post
  end
  
  private

  def post_params
    params.require(:post).permit(:name, :description)
  end  
end
