class FlightsController < ApplicationController
  def index
    @start_year, @end_year = Flight.year_range
    @airport_options = Airport.all
    @search_params = params[:search] ? Flight.parse_search_params(search_params) : {}
    @flights = params[:search] ? Flight.matching_search(@search_params) : nil
  end

  private

  def search_params
    params.require(:search).permit(:departure_date, :departure_airport_id,
                                   :arrival_airport_id, :number_of_passengers)
  end
end
