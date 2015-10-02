json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :student_number, :email, :phone_number, :email_opt_in, :home_directory, :profile_picture
  json.url user_url(user, format: :json)
end
