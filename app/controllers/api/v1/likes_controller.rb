class Api::V1::LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    render json: @like, status: 201
  end

  def destroy
    Like.find(params[:id]).destroy
  end

  private
  def like_params
    params.permit(:user_id, :reply_id, :positive)
  end
end
