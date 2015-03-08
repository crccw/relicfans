json.array!(@messages) do |message|
  json.extract! message, :id, :msg_id, :to_user_name, :from_user_name, :msg_type, :content
  json.url message_url(message, format: :json)
end
