# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create 15 jobs
15.times do
  forward_days = rand(10)
  random_deadline = rand(100)*10 + forward_days
  user = User.all.sample
  job = Job.new
  job.title = Faker::Job.title
  job.description = Faker::Lorem.paragraphs
  job.pay = Faker::Number.number(digits: 5)
  job.start_date = Faker::Date.forward(days: forward_days)
  job.deadline = Faker::Date.forward(days: forward_days + random_deadline)
  job.employer = user
  job.save
end