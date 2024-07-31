class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.datetime :expiration_date
      t.string :dosage
      t.string :description

      t.timestamps
    end
  end
end
