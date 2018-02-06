json.errors do
  json.messages do
    json.array! model_instance.errors.full_messages
  end
  json.attributes model_instance.errors.messages
end
