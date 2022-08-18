# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
[['San Francisco International', 'SFO'], 
 ['John F. Kennedy International', 'JFK'],
 ["Chicago O'Hare International", 'ORD'],
 ['Denver International', 'DEN'],
 ['Hong Kong International', 'HKG'],
 ['Tokyo International', 'HND'],
 ['Paris Charles de Gaulle', 'CDG']].each do |name, code|
    Airport.create(name: name, code: code)
 end
