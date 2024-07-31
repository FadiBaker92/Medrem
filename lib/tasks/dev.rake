desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    Prescription.destroy_all
    Reminder.destroy_all
    Medication.destroy_all
    User.destroy_all
  end
  6.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      first_name: name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber.cell_phone
    )
  end


end
