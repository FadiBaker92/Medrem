# == Schema Information
#
# Table name: reminders
#
#  id              :bigint           not null, primary key
#  message         :string
#  sent_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  prescription_id :integer
#
class Reminder < ApplicationRecord
  belongs_to :prescription, required: true, class_name: "Prescription", foreign_key: "prescription_id"
end
