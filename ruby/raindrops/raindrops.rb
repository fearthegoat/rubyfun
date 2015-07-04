class Raindrops
	
	def self.convert(number)
		a = []
		if divisible_by(number, 3)
			a << "Pling"
		end
		if 
			divisible_by(number, 5)
			a << "Plang"
		end
		if	
			divisible_by(number, 7)
			a << "Plong"
		end
		a.length < 1 ? number.to_s : a.join("")
	end

	def self.divisible_by(number, prime)
		number % prime == 0
	end

end