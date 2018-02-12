if @user_authenticated
  json.partial! 'api/v1/sessions/user_info', locals: {user:  @user}
  json.partial! 'api/v1/sessions/token',
    locals: {token:  user_token,
             display_token_if: (@user.valid? && @user_authenticated)}
else
  json.partial! 'layouts/error_messages', locals: { model_instance: @user }
end
