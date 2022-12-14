DATA MODELS

Booking
  has_many :passengers
  belongs_to :flight

Passenger
  first_name string
  middle_name string
  last_name string
  birthdate date
  email string

  belongs_to :booking

Flight
  identifier string
  departure time datetime
  arrival time datetime
  duration as model attribute

  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :airline
  belongs_to :departure_airport, class_name: Airport
  belongs_to :arrival_airport, class_name: Airport

Airline
  name string

  has_many :flights
  has_many :bookings, through: :flights

Airport
  name string
  code string

  has_many :departing_flights, class_name: Flight, foreign_key: departure_airport_id
  has_many :arriving_flights, class_name: Flight, foreign_key: arrival_airport_id

EXTENDED DATA MODELS

Order
  has_many :bookings

Booking
  checked_bags integer

  belongs_to :passenger
  belongs_to :flight

Passenger
  first_name string
  middle_name string
  last_name string
  birthdate date
  email string

  has_one :booking
  has_one :flight, through: :booking

Flight
  identifier string
  departure time datetime
  arrival time datetime
  duration as model attribute

  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :airline
  belongs_to :departure_airport, class_name: Airport
  belongs_to :arrival_airport, class_name: Airport

Airline
  name string

  has_many :flights
  has_many :bookings, through: :flights

Airport
  name string
  code string

  has_many :departing_flights, class_name: Flight, foreign_key: departure_airport_id
  has_many :arriving_flights, class_name: Flight, foreign_key: arrival_airport_id
  has_many :departing_passengers, through: :departing_flights, source: :passengers
  has_many :arriving_passengers, through: :arriving_flights, source: :passengers
  belongs_to :city

City
  name string

  belongs_to :region

Region
  name string
  same_as_country boolean

  has_many :cities
  has_many :airports, through: :cities
  belongs_to :country

Country
  name string

  has_many :regions
  has_many :cities, through: :regions
  has_many :airports, through: :cities
