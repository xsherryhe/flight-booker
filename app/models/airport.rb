class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id', dependent: :destroy
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id', dependent: :destroy

  def name_code_display
    "#{name} (#{code})"
  end
end
