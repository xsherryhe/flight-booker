class BookingsController < ApplicationController
  def new
    @booking = Flight.find(params[:flight_id]).bookings.build
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      send_confirmation_emails
      redirect_to @booking
    else
      @booking.passengers.build while @booking.passengers.size < params[:number_of_passengers].to_i
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:flight_id,
                  passengers_attributes:
                    %i[first_name middle_name last_name date_of_birth email])
  end

  def send_confirmation_emails
    @booking.passengers.each do |passenger|
      PassengerMailer.with(passenger:, booking: @booking)
                     .confirmation_email.deliver_later
    end
  end
end
