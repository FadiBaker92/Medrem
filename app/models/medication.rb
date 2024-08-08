# == Schema Information
#
# Table name: medications
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Medication < ApplicationRecord
  has_many  :prescriptions, class_name: "Prescription", foreign_key: "user_id", dependent: :destroy
end
