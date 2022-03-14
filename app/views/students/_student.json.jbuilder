json.extract! student, :id, :title, :body, :image_data, :created_at, :updated_at
json.url student_url(student, format: :json)
