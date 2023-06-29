class Category < ApplicationRecord
	has_many :courses, dependent: :delete_all
end
