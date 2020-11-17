require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
email: Faker::Internet.email,
phone_number: "1234567899",
first_name: "Christina",
last_name: "Bowers",
password: 123456
)
10.times do
  job = Job.new(
    title: Faker::Job.title,
    description: Faker::Lorem.sentence(word_count: 8),
    pay: Faker::Number.number(digits: 6), #tostring?
    start_date: Faker::Date.forward(days: 25),
    deadline: Faker::Date.forward(days: 5)
    )
  job.employer = user
  job.save
end
