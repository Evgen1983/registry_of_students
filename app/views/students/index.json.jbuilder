json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :learning_team, :birthday, :email, :ip_adress
  json.url student_url(student, format: :json)
end
