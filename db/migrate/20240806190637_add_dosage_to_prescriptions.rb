class AddDosageToPrescriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :prescriptions, :dosage, :string
  end
end
