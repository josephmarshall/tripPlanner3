User.create(email: "test@test.com", password: "password")

3.times do
  Trip.create(name: Faker::Nation.capital_city, start_date:"2019-01-01", end_date:"2019-01-04", user_id:1)
end

10.times do
  Location.create(name: Faker::Address.city, days: rand(1..10), trip_id: rand(1..3))
end

for location_id in 1..30 do
  Address.create(street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, location_id: location_id)
end

puts "seeded."