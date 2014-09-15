json.array!(@users) do |user|
  json.extract! user, :firstname, :lastname, :email, :password, :password_confirmation
  json.url user_url(user, format: :json)
end
