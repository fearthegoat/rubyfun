a = [2, 7, 3, 5, 4, 11, 15]
b = a.combination(2)
target = 9
success = []
b.each do | x, y |
	if x + y == target
		success << [x,y]
	end
end
success.each do |x,y|
	index1 = a.index(x)
	index2 = a.index(y)
	puts(index1, index2)
end