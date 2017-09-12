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
    Question.find_by(:id => params[:id]).destroy
  end

  def show
    @question = Question.includes(:questioner).includes(:replies).includes(:replies => [{:likes => :user}, :replier]).find_by(:id => params[:id])
    include_hash = {
      :include => [:questioner, :replies => {
        :include => [{:likes => {:include => :user}}, :replier]
        }
      ]
    }
    render json: @question.as_json(include_hash), status: 200
  end

  private
  def question_params
    params.permit(:title, :content, :questioner_id)
  end
end
