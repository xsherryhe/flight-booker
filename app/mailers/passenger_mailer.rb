class PassengerMailer < ApplicationMailer
  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @flight = @booking.flight
    date = @flight.departure_time.strftime('%-m/%-d/%Y')
    mail(to: email_address_with_name(@passenger.email, @passenger.full_name),
         subject: "Your flight on #{date} is booked!")
  end
end
