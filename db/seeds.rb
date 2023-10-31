# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Cleaning database...'
Island.destroy_all
User.destroy_all

puts 'Creating users'

user1 = User.create(first_name: "Adam", last_name: "Amylynn", email: "adamamylynn@gmail.com", password: "123456")

puts 'Creating islands...'

mysterious = {
  name: 'Mysterious', location: 'Blue bay',
  price: 500, user: user1
}
coconut = {
  name: 'Coconut', location: 'Mahe',
  price: 700, user: user1
}

anse = {
  name: 'Anse', location: 'Anse Etoile',
  price: 1000, user: user1
}

desroches = {
  name: 'Desroches', location: 'Seychelles',
  price: 1300, user: user1
}

praslin = {
  name: 'Praslin', location: 'Palme',
  price: 1700, user: user1
}

[mysterious, coconut, anse, desroches, praslin].each do |attributes|
  @island = Island.create!(attributes)
  puts "Created #{@island.name}"
end
puts 'Finished!'
