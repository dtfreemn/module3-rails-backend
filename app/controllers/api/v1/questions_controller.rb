class Api::V1::QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render json: @questions, status: 200
  end

  def create
    @question = Question.create(question_params)
    render json: @question, status: 201
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private
  def question_params
    params.permit(:title, :content, :questioner_id)
  end
end
