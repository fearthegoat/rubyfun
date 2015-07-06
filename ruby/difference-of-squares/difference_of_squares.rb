class Squares
	def initialize(number)
		@a = (1..number).to_a		
	end

	def square_of_sums
		summed_numbers = @a.inject(0){ | result, number| result + number}
		summed_numbers**2
	end

	def difference
		square_of_sums - sum_of_squares
	end

	def sum_of_squares
		numbers_squared = @a.inject(0) { | result, number| result + number**2 }
	end

end
