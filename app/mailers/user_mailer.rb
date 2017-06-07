class UserMailer < ApplicationMailer
	 default from: 'legit5566@gmail.com'

	def booking_email(customer, host, booking_id)
		@customer = customer
		@host = host
		@booking_id = booking_id
		# @url = '<%= link_to 'Your Booking', booking_path(@booking_id) %>'
	    @url  = 'http://example.com/login'
	    mail(to: @host.email, subject: 'Welcome to My Awesome Site')
    end
end
