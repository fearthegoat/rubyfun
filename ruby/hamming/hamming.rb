class Hamming
	def self.compute(x, y)
	 	raise ArgumentError, "Too many arguments" if x.length != y.length
		a = []
		b = []
		c = []
		sum = 0
		a = x.split("") 
		a.map! {|string| string.ord}
		b = y.split("")
		b.map! {|string| string.ord}
		c = a.zip(b).map {|e, d| d - e}
		c.map! {|number| number == 0 ? 0 : 1} 
		sum = c.inject(0){|t,result| t + result}
		sum
	end
	VERSION = 1
end
