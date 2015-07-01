class Hamming
	def self.compute(x, y)
	a = []
	b = []
	c = []
	a = x.split("") 
	a.map! {|string| string.ord}
	b = y.split("")
	b.map! {|string| string.ord}
	c = a - b
	c.size
	end
end
