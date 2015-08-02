a = []
b = []
c = []
d = []

500.times do 
	a << rand(1...500)
	end
500.times do 
	b << rand(1...500)
	end

a.each do |number|
	d << number
	size_initial = b.size
	e = b - d
	size_initial == e.size ? nil : c << number
	d = []
end
puts "#{c.count}"
#run this 10,000 times and take average in roundabout way to find theoretical