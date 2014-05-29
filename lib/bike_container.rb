module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise FullContainerException.new if full?
		bikes << bike
	end

	def release(bike = nil)
		raise NoArgumentsError.new if bike.nil?
		raise EmptyContainerException.new if self.empty?
		bikes.delete(bike)
		# can be replaced by pop, so no input arguments necessary
		#bikes.pop
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end
	
end