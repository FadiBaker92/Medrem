class AddExpirationDateToPrescriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :prescriptions, :expiration_date, :date
  end
end
