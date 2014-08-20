class EmptyContainerException < Exception

	def initialize(msg = "There's no bike.")
		super
	end

end

class NoArgumentsError < Exception

	def initialize(msg = "No bike has been set to release.")
		super
	end
end

class FullContainerException < Exception

	def initialize(msg = "The container is full.")
		super
	end

end