class BookingsController < ApplicationController
	def create
		@listing = Listing.find(params[:listing_id])
		@booking = current_user.bookings.new(booking_params)
		@booking.listing = @listing
		@host = User.find(@listing.user_id)
		if @booking.save
			# UserMailer.booking_email(current_user, @host, @booking.id).deliver_now
			BookingJob.perform_later(current_user, @host, @booking.id)
			redirect_to @listing, notice: "Your booking is successful"
		else
			@errors = @booking.errors.full_messages
			render 'listings/show'
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to current_user
	end

	def booking_params
		params.require(:booking).permit(:num_of_guest, :start_date, :end_date)
	end
end
