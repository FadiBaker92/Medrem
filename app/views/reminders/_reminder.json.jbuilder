json.extract! reminder, :id, :sent_at, :message, :prescription_id, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
