array_sum.rb
a = []
b = []
desired_result = 500
150.times do 
a << rand(1..499)	
b << rand(1..499)	
end
a.sort!
b.sort!
if a[0] + b[-1] == 500 
  puts("success")

elsif 
	a[x] + b[-y] > 500
	#destroy b[-1] from array, or proceed to -2
  y += 1
else
	a[x] + b[-y] > 500
	#destroy a[0]
  x += 1
end