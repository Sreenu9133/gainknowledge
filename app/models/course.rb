class Course < ApplicationRecord
	belongs_to :category
	has_many :bookings
	belongs_to :users
	# self.per_page = 5
end

# WillPaginate.per_page = 5