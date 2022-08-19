class FlightsController < ApplicationController
  def index
    @start_year, @end_year = Flight.year_range
    @airport_options = Airport.all
    @page = params[:page].to_i || 1
    @search_params = params[:search] ? Flight.parse_search_params(search_params) : {}
    @all_flights = Flight.matching_search(@search_params) if params[:search]
    @page_flights = @all_flights.from_page(@page, 10) if @all_flights
  end

  private

  def search_params
    params.require(:search).permit(:departure_date, :departure_airport_id,
                                   :arrival_airport_id, :number_of_passengers)
  end
end
