require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating user...'
user = User.create(
email: Faker::Internet.email,
phone_number: "1234567899",
first_name: "Christina",
last_name: "Bowers",
password: 123456
)
puts 'User created! Now creating jobs...'
15.times do
  job = Job.new(
    title: "#{Faker::Hipster.word.capitalize} #{Faker::Job.position}",
    description: Faker::Lorem.sentence(word_count: 8),
    pay: Faker::Number.number(digits: 4),
    start_date: Faker::Date.between(from: 1.day.from_now, to: 5.day.from_now),
    deadline: Faker::Date.between(from: 6.day.from_now, to: 10.day.from_now)
    )
  job.employer = user
  job.save!
end
puts 'Jobs created!'
