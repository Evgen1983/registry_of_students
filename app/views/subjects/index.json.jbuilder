json.array!(@student.subjects) do |subject|
  json.extract! subject, :id, :student_id, :semestr, :name, :grade
  json.url student_subject_url(subject.student, subject, format: :json)
end
