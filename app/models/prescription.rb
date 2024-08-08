# == Schema Information
#
# Table name: prescriptions
#
#  id              :bigint           not null, primary key
#  description     :string
#  dosage          :string
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  medication_id   :integer
#  user_id         :integer
#
class Prescription < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :medication, required: true, class_name: "Medication", foreign_key: "medication_id"
  has_many  :reminders, class_name: "Reminder", foreign_key: "prescription_id", dependent: :destroy
end
