class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.datetime :sent_at
      t.string :message
      t.integer :prescription_id

      t.timestamps
    end
  end
end
