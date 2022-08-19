# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.delete_all
Airport.delete_all
[['San Francisco International', 'SFO'],
 ['John F. Kennedy International', 'JFK'],
 ["Chicago O'Hare International", 'ORD'],
 ['Denver International', 'DEN'],
 ['Hong Kong International', 'HKG'],
 ['Tokyo International', 'HND'],
 ['Paris Charles de Gaulle', 'CDG']].each do |name, code|
   Airport.create(name:, code:)
 end

def identifier
  [*'A'..'Z', *'0'..'9'].sample(5).join
end

def arrival_time(departure_time)
  departure_time + rand(2..15).hours + rand(60).minutes
end

def arrival_airport(departure_airport)
  Airport.where.not(id: departure_airport.id).sample
end

def create_flight
  departure_time = rand(0..365).days.from_now + rand(24).hours + rand(60).minutes
  departure_airport = Airport.all.sample

  Flight.create(identifier:, departure_time:, arrival_time: arrival_time(departure_time),
                departure_airport:, arrival_airport: arrival_airport(departure_airport))
end

500.times { create_flight }
