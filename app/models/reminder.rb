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
end
