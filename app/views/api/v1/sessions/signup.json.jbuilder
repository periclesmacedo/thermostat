if @user.valid?
  json.name @user.name
  json.email @user.email
  json.token @token
else
  json.partial! 'layouts/error_messages', locals: { model_instance: @user }
end
