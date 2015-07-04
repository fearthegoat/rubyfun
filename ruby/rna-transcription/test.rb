a = "kevin"
x = -1
c = []
a.size.times do 
	c << a[x] 
	x-=1 
	end
puts c.join("")
