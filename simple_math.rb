class Mathematics

	a = []
	b = [10, 100, 1000, 10000, 100000, 1000000, 10000000]  #by varying the number of random numbers generated we can view the convergence to 500.
	
	
	convergence = []
	b.each do |n|
		#average 
		average = 0.0
		n.times {a << rand(1..1000)}  	
		total_number = a.inject(0.0) { |result, number| number + result}
		puts "Total number #{total_number}"
		average = total_number/a.size
		puts "Sum of the #{a.size} numbers are #{total_number}"
		puts "Average of all the numbers are #{average}" #should converge on 500
		convergence << (500-average).abs
		
		#variance and standard deviation
		sum_of_squares = 0.0
		a.each do |t|
			c = 0
			c = t - average
			y = c**2
			sum_of_squares = sum_of_squares + y
		end
		variance = sum_of_squares / a.size
		std_deviation = Math.sqrt(variance)
		puts "the variance is #{variance}"
		puts "the standard deviation is #{std_deviation}"
	end

	puts ""
	puts ""
	puts "absolute value of the differences between set average and expected average of 500"
	convergence.each {|number| puts number.round(2)}
end
