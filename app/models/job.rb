class Job < ApplicationRecord
	validates :title, :description, :wage_upper_bound, :wage_lower_bound, :field, :location, presence: true
	validates :wage_lower_bound, :wage_upper_bound, numericality: {:greater_than => 0}
	def publish!
		self.is_hidden = false
		save
	end

	def hide!
		self.is_hidden = true
		save
	end

	scope :recent, -> {order("created_at DESC")}
	scope :published, -> {where(:is_hidden => false)}
end
