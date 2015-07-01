class Hamming
	def self.compute(x, y)
	a = []
	b = []
	c = []
	sum = 0
	a = x.split("") 
	a.map! {|string| string.ord.to_i}
	b = y.split("")
	b.map! {|string| string.ord.to_i}
	# puts "a #{a}"
	# puts ""
	# puts "b #{b}"
	c = a.zip(b).map {|e, d| d - e}
	# puts "c #{c}"
	c.map! {|number| number == 0 ? 0 : 1} 
	sum = c.inject(0){|t,result| t + result}
	sum
	# puts "sum #{sum}"
	end
end
# Hamming.compute('AATG', 'AAA')