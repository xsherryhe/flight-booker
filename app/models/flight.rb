class Flight < ApplicationRecord
  extend DateManager

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :airline
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  scope :on_departure_date, (lambda do |date|
    return self unless date

    where('departure_time >= ?', date.to_datetime)
    .where('departure_time < ?', (date + 1.day).to_datetime)
  end)

  scope :departing_from_airport, (lambda do |departure_airport_id|
    departure_airport_id.blank? ? self : where(departure_airport_id:)
  end)

  scope :arriving_at_airport, (lambda do |arrival_airport_id|
    arrival_airport_id.blank? ? self : where(arrival_airport_id:)
  end)

  scope :matching_search, (lambda do |search_params|
    on_departure_date(search_params[:departure_date])
    .departing_from_airport(search_params[:departure_airport_id])
    .arriving_at_airport(search_params[:arrival_airport_id])
    .order(:departure_time)
    .includes(:airline, :departure_airport, :arrival_airport)
  end)

  scope :from_page, ->(page, per_page) { limit(per_page).offset((page.to_i - 1) * per_page) }

  def self.parse_search_params(search_params)
    search_params.merge({ departure_date: parse_date_from_params(:departure_date, search_params) })
  end

  def self.year_range
    [minimum(:departure_time).year, maximum(:departure_time).year]
  end
end
