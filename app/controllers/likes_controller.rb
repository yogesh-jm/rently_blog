# frozen_string_literal: true

# Controller for creation and retrieval for Likes
class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(params[:like].permit(:post_id, :comment_id, :entity))

    render json: @like
  end

  def index
    @post = Post.find(params[:post_id])
    @likes = @post.likes
    render json: @likes
  end
end
