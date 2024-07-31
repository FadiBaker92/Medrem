json.extract! medication, :id, :name, :expiration_date, :dosage, :description, :created_at, :updated_at
json.url medication_url(medication, format: :json)
