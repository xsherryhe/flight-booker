class FlightsController < ApplicationController
  def index
    @start_year, @end_year = Flight.year_range
    @airport_options = Airport.all
  end
end
