class Api::V1::RepliesController < ApplicationController
  def index
    @replies = Reply.where(question_id: params[:question_id])
    render json: @replies, status: 200
  end

  def create
    @reply = Reply.include_all.create(reply_params)
    render json: @reply.as_json(include_hash), status: 201
  end

  def destroy
    render json: Reply.find(params[:id]).destroy, status: 202
  end

  private
  def reply_params
    params.permit(:title, :content, :replier_id, :question_id)
  end

  def include_hash
    {
      :include => [:replier, :likes]
    }
  end

end
