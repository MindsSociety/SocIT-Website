json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :id, :create_time, :subject_line
  json.url newsletter_url(newsletter, format: :json)
end
