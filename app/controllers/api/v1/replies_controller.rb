class Api::V1::RepliesController < ApplicationController
  def index
    @replies = Reply.where(question_id: params[:question_id])
    render json: @replies, status: 200
  end

  def create
    @reply = Reply.create(reply_params)
    render json: @reply, status: 201
  end

  def destroy
    Reply.find(params[:id]).destroy
  end

  private
  def reply_params
    params.permit(:title, :content, :replier_id, :question_id)
  end
end
