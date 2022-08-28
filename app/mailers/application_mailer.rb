class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("no-reply@rocky-shore-24771.herokuapp.com", 'Flight Booker')
  layout "mailer"
end
