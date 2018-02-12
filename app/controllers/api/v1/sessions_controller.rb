require 'web_token'

class Api::V1::SessionsController < ApplicationController
  helper_method :user_token

  def signup
    @user = User.create(session_params)
  end

  def signin
    @user = User.find_by_email(session_params[:email])
    @user_authenticated = @user && @user.authenticate(session_params[:password])
  end

  private

  def user_token
    @token ||= WebToken.encode({id: @user.id, email: @user.email})
  end

  def session_params
    params.permit(:name, :email, :password, :password_confirmation, :token)
  end
end
