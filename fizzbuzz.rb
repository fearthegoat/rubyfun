# fizz buzz
100.times do |d|
	d +=1
	if 
		d % 3 == 0 && d % 5 == 0 
		puts "fizzbuzz"
	elsif 
		d % 5 == 0
		puts "buzz"
	elsif 	
		d % 3 == 0
		puts "fizz"
	else
		puts d 
	end
end
puts ""

puts "anagram"
a = ["fish", "halah", "menu", "cannac", "parses", "anna"]
a.map! do |t|
	if
	t === t.reverse
	t
	end
end
puts a
puts ""

puts "simple recursion"
def countdown(n)
	if n == 0 
		puts "blastoff"
		return
	end
	puts n
	countdown(n-1)
end
countdown(5)


puts ""
puts "Array find"
a = ["sarah","susan","brian","max"]



def find(a,n)
	puts "#{n} value in array"
	 if
	a.size > n-1 && n-1 > 0
	puts a[n-1]
	else
	puts "Does not exist, -1"
	end
end
find(a, 1)

# b = 1
# a = 0
# def fibonacci(n)
# return if n > 100
# b =+ 1
# puts n
# fibonacci(n+b)
# end


# 0
# 1
# 1
# 2
# 3
# 5
# 13
# 18
# 31
# 49
# 80