# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "okanb3@gmail.com", password: "test1234")

5.times do |i|
  Company.create(name: "Company ##{i}", address: "An address for company ##{i}.")
  Device.create(name: "Device ##{i}", address: "An CoAP addres for device ##{i}", user_id: 1, company_id: i+1)
  5.times do |j|
    Datum.create(name: "Data ##{j}", value: rand(0..40), device_id: i+1)
  end
end
