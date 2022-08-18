Data models

Passenger
-first_name
-middle_name
-last_name
-birthdate

belongs_to :flight
has_one :seat

Seat
-number

belongs_to :flight
belongs_to :passenger

Flight
-number

has_many :seats
has_many :passengers, through: :seats
belongs_to :airline
belongs_to :origin, class_name: Airport
belongs_to :destination, class_name: Airport

Airline
-name string

has_many :flights
has_many :passengers, through: :flights

Airport
-name string

belongs_to :city
has_many :departing_flights, foreign_key: origin_id
has_many :arriving_flights, foreign_key: destination_id
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
