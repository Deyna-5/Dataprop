# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##Creating Users
User.destroy_all
10.times do
       User.create(
              name: Faker::Name.name,
              rut: Faker::ChileRut.rut, 
              email: Faker::Internet.email,
              password: Faker::Internet.password(min_length: 10, max_length: 20)
       )
end

##Creating Properties
Property.destroy_all
array_property = []
20.times do |prop|
       prop = Property.create(
              price: rand(250.000..900.000),
              direction: Faker::Address.street_address,
              area: rand(60..500).to_s + "mt2",
              rooms: rand(1..5),
              bathrooms: rand(1..5),
              user_id: rand(1..10)
       )
       array_property.push(prop)
end

array_property.each do |property|
       property.photo.attach(io: File.open('app/assets/images/prueba1.jpeg'), filename: "casa de prueba", content_type: "image/jpeg")
end

##Creating Likes
Like.destroy_all
20.times do
       Like.create(
              user_id: rand(1..10),
              property_id: rand(1..20)
       )
end