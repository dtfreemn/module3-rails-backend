class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    render json: @user, status: 201
  end

  def destroy
    User.find(params[:id]).update(active: false)
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
