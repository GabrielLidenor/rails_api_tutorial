class Api::V1::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    @hotel = Post.find(params[:id])
    render json: @hotel
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      render json: @post
    else
      render status: :unprocessable_entity 
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :author, :description)
    end
end
