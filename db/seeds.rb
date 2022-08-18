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

Flight.delete_all
10.times do
   departure_time = rand(1..1000).days.ago
   arrival_time = departure_time + rand(2..15).hours + rand(60).minutes
   departure_airport = Airport.all.sample
   arrival_airport = Airport.where.not(id: departure_airport.id).sample

   Flight.create(identifier: [*'A'..'Z', *'0'..'9'].sample(5).join,
                 departure_time: departure_time,
                 arrival_time: arrival_time,
                 departure_airport: departure_airport,
                 arrival_airport: arrival_airport)
end
