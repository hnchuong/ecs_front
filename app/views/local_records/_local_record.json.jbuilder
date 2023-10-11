json.extract! local_record, :id, :name, :created_at, :updated_at
json.url local_record_url(local_record, format: :json)
