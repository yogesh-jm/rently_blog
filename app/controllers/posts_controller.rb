# frozen_string_literal: true

# Controller for creation and retrieval for Posts
class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render error: { error: 'Unable to create Post.' }, status: 400
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

  def total_data
    posts_collection = []
    @posts = Post.where(user_id: 1)

    @posts.each do |post|
      data = format_post(post)
      posts_collection.push(data)
    end

    render json: posts_collection
  end

  def format_post(post)
    formatted_post = {}
    formatted_post['post_id'] = post.id
    formatted_post['comment_count'] = post.comments.count
    formatted_post['likes_count'] = post.likes.count

    formatted_post
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :user_id)
  end
end
