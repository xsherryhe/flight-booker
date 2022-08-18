Data models

Order
  has_many :bookings

Booking
  checked_bags integer

  belongs_to :passenger
  belongs_to :seat

Passenger
  first_name string
  middle_name string
  last_name string
  birthdate date

  has_one :booking
  has_one :seat, through: :booking

Seat
  identifier string

  belongs_to :flight
  has_one :booking
  has_one :passenger, through: :booking

Flight
  identifier string

  has_many :seats
  has_many :passengers, through: :seats
  belongs_to :airline
  belongs_to :departure_airport, class_name: Airport
  belongs_to :arrival_airport, class_name: Airport

Airline
  name string
  code string

  has_many :flights
  has_many :bookings, through: :flights

Airport
-name string

belongs_to :city
has_many :departing_flights, foreign_key: departure_airport_id
has_many :arriving_flights, foreign_key: arrival_airport_id
has_many :departing_passengers, through: :departing_flights, source: :passengers
has_many :arriving_passengers, through: :arriving_flights, source: :passengers

City
-name string

belongs_to :region

Region
-name string
-same_as_country boolean

has_many :cities
has_many :airports, through: :cities
belongs_to :country

Country
-name string

has_many :regions
has_many :cities, through: :regions
has_many :airports, through: :cities
