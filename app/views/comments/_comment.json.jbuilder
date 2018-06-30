json.extract! comment, :id, :name, :body, :notice_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
