require 'web_token'

class Api::V1::SessionsController < ApplicationController
  def signup
    if @user = User.create(session_params)
      @token = WebToken.encode({id: @user.id, email: @user.email})
    end
    @user
  end

  def session_params
    params.permit(:name, :email, :password, :password_confirmation, :token)
  end
end
