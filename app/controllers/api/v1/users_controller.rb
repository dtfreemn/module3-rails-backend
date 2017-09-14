class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    @user = User.include_all.find_by(id: @user.id)
    render json: @user.as_json(include_hash), status: 201
  end

  def destroy
    User.find(params[:id]).update(active: false)
  end

  def show
    @user = User.include_all.find_by(id: params[:id])
    render json: @user.as_json(include_hash), status: 200
  end

  private
  def user_params
    params.permit(:name, :email)
  end

  def include_hash
    {
      :include => [:questions]
    }
  end
end
