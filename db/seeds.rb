require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
users << { email: "antonio@gmail.com",
           phone_number: "34289653489",
           first_name: "Antonio",
           last_name: "Banderas",
           password: "tono1234"}
users << { email: "calvin@gmail.com",
           phone_number: "5623908723",
           first_name: "Calvin",
           last_name: "Klein",
           password: "cal1234"}
users << { email: "carolina@gmail.com",
           phone_number: "5623908723",
           first_name: "Carolina",
           last_name: "Herrera",
           password: "caro1234"}
users << { email: "emilie@gmail.com",
           phone_number: "5623908723",
           first_name: "Emilie",
           last_name: "Lockey",
           password: "emi1234"}
users << { email: "christina@gmail.com",
           phone_number: "5623908723",
           first_name: "Christina",
           last_name: "Bowers",
           password: "chris1234"}
users << { email: "luis@gmail.com",
           phone_number: "5623908723",
           first_name: "Luis",
           last_name: "Zubia",
           password: "luis1234"}
users << { email: "lady@gmail.com",
           phone_number: "5323908723",
           first_name: "Lady",
           last_name: "Chihuahua",
           password: "lady1234"}
users << { email: "francisco.pope@vatican.va",
           phone_number: "5623908723",
           first_name: "Francisco",
           last_name: "Pope",
           password: "papa1234"}

puts 'Creating users...'
users.each do |user|
  user = User.create(user)
end
puts 'Users were created...'
puts ''

puts 'Now creating jobs...'
15.times do
  job = Job.new(
    title: "#{Faker::Hipster.word.capitalize} #{Faker::Job.position}",
    description: Faker::Lorem.sentence(word_count: 8),
    pay: Faker::Number.number(digits: 4),
    start_date: Faker::Date.between(from: 1.day.from_now, to: 5.day.from_now),
    deadline: Faker::Date.between(from: 6.day.from_now, to: 10.day.from_now)
    )
  user = User.all.sample
  job.employer = user
  job.save
end
puts 'Jobs created!'
