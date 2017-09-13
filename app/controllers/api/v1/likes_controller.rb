class Api::V1::LikesController < ApplicationController

  def create
    # Swaps the points
    @possibleLike = Like.find_by(user_id: like_params[:user_id], reply_id: like_params[:reply_id])

    if @possibleLike && @possibleLike.point == like_params[:point]
      @possibleLike.destroy
      render json: [], status: 200
    elsif @possibleLike
      @possibleLike.point = like_params[:point]
      @possibleLike.save
      render json: @possibleLike, status: 200
    else
      # Tries to create the new vote
      @like = Like.create(like_params)
      if @like.valid?
        render json: @like, status: 201
      else
        render json: [], status: 403
      end
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
