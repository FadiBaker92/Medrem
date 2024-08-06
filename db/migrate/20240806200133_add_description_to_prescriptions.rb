class AddDescriptionToPrescriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :prescriptions, :description, :string
  end
end
