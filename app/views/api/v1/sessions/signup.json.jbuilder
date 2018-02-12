if @user.valid?
  json.partial! 'api/v1/sessions/user_info', locals: {user:  @user}
  json.partial! 'api/v1/sessions/token', locals: {token:  @token}
else
  json.partial! 'layouts/error_messages', locals: { model_instance: @user }
end
