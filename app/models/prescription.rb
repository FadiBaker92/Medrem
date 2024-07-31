# == Schema Information
#
# Table name: prescriptions
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  medication_id :integer
#  user_id       :integer
#
class Prescription < ApplicationRecord
end
