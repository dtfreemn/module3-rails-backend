class Api::V1::QuestionsController < ApplicationController

  def index
    @questions = Question.includes(:questioner).includes(:replies).includes(:replies => [{:likes => :user}, :replier])
    render json: @questions.as_json(include_hash), status: 200
  end

  def create
    @question = Question.create(question_params)
    @question = Question.includes(:questioner).includes(:replies).includes(:replies => [{:likes => :user}, :replier]).find_by(id: @question.id)
    render json: @question.as_json(include_hash), status: 201
  end

  def destroy
    Question.find_by(:id => params[:id]).destroy
    render json: [], status: 202
  end

  def show
    @question = Question.includes(:questioner).includes(:replies).includes(:replies => [{:likes => :user}, :replier]).find_by(:id => params[:id])

    render json: @question.as_json(include_hash), status: 200
  end

  private
  def question_params
    params.permit(:title, :content, :questioner_id)
  end

  def include_hash
    {
      :include => [:questioner, :replies => {
        :include => [{:likes => {:include => :user}}, :replier]
        }
      ]
    }
  end
end
