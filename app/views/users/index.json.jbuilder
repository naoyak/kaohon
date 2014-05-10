json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :name
  json.url user_url(user, format: :json)
end
