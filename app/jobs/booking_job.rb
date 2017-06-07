class BookingJob < ApplicationJob
  queue_as :default

  def perform(current_user, host, booking_id)
  	UserMailer.booking_email(current_user, host, booking_id).deliver_now
    # Do something later
  end
end
