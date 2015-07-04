class Complement
	def self.of_dna(array)
		a = []
		b = []
		array.upcase!
		array.each_char do |c|
			a << c if /[G,C,A,T]/ =~ c
		end
		raise ArgumentError, "Not valid input" if array.size != a.size
		b = a.join("").gsub(/[G,C,A,T]/, 'G' => 'C', 'C' => 'G','A' => 'U', 'T' => 'A')
		b
	end	

	def self.of_rna(array)
		a = []
		b = []
		array.upcase!
		array.each_char do |c|
			a << c if /[G,C,A,U]/ =~ c
		end
		raise ArgumentError, "Not valid input" if array.size != a.size
		b = a.join("").gsub(/[G,C,A,U]/, 'G' => 'C', 'C' => 'G','U' => 'A', 'A' => 'T')
		b
	end

end
