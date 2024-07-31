class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.integer :user_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
