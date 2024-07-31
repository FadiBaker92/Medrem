# == Schema Information
#
# Table name: medications
#
#  id              :bigint           not null, primary key
#  description     :string
#  dosage          :string
#  expiration_date :datetime
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Medication < ApplicationRecord
end
