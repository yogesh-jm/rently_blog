# frozen_string_literal: true

# Controller for creation and retrieval for Comments
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))

    render json: @comment
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end
end
