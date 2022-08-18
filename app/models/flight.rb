class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.year_range
    [minimum(:departure_time).year, maximum(:departure_time).year]
  end
end
