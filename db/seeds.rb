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

user_one = User.create(first_name: "Adam", last_name: "Amylynn", email: "adamamylynn@gmail.com", password: "123456")

puts 'Creating islands...'

la_digue = {
  name: 'La Digue', location: 'Seychelles',
  price: '$ 1200', user: user_one
}
mahe = {
  name: 'Mahe', location: 'Seychelles',
  price: '$ 1400', user: user_one
}

anse_etoile = {
  name: 'Anse Etoile', location: 'Seychelles',
  price: '$ 2000', user: user_one
}

bird_island = {
  name: 'Bird Island', location: 'Seychelles',
  price: '$ 2000', user: user_one
}

[la_digue, mahe, anse_etoile, bird_island].each do |attributes|
  @island = Island.create!(attributes)
  puts "Created #{@island.name}"
end
puts 'Finished!'
