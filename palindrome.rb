a = "anna"
b = []
a.each_char do |char|
b.unshift(char)
end
puts b 
c = b.join("").to_s
a == c ? puts("palindrome") : puts("not palindrome")
