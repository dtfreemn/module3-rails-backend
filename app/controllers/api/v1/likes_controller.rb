class Api::V1::LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    if @like.valid?
      render json: @like, status: 201
    else
      render json: [], status: 403
    end
  end

  def destroy
    Like.find(params[:id]).destroy
  end

  private
  def like_params
    params.permit(:user_id, :reply_id, :point)
  end
end
