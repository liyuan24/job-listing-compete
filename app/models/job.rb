class Job < ApplicationRecord
	validates :title, :description, :wage_upper_bound, :wage_lower_bound, :field, :location, presence: true
	validates :wage_lower_bound, :wage_upper_bound, numericality: {:greater_than => 0}
end
