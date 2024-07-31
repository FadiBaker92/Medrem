json.extract! prescription, :id, :user_id, :medication_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
