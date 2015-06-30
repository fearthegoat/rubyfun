
puts "please enter name"
name = gets

def greeting(name)
	if name.size > 1
		puts "Hello #{name}" 
	else 
		puts "Hello World"
	end
end
greeting name
