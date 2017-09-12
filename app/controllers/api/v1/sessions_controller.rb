class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      session[:user] = @user
      render json: @user, status: 200
    else
      render json: {status: 404, message: "user not found"}, status: 404
    end
  end

  def destroy
    session.clear
    render json: [], status: 202
  end
end
