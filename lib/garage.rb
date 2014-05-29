require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept_bike_from(van)
		van.broken_bikes.each do |broken_bike|
			self.dock(broken_bike)
			van.release(broken_bike)
			broken_bike.fix!
		end
	end
end