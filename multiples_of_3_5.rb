#sum of multiples of 3 or 5 below 1000

#find the numbers that are multiples of 3 or 5

a = (1...1000)
b = []
a.each do |n|
	if n % 3 == 0 || n % 5 == 0  #determines if number is divisible by 3 or 5
		b << n
	end
end
sum = b.inject(0){|number, result| number + result}  #sums all the numbers
puts sum
