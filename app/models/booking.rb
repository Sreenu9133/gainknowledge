class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def booking_count
    puts "Total number of bookings are #{Booking.count} bookings."
  end
end
