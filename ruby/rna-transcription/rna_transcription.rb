class Complement
	
	DNA_components = "C","G","T","A" #order is important		
	RNA_components = "G","C","A","U" #order is important

	def self.of_dna(array)
		b = []
		a = []
		array.each_char do |c|
			a << c if /#{DNA_components}/ =~ c
		end
		raise ArgumentError, "Not valid input" if array.size != a.size
		b = a.join("").tr("#{DNA_components}", "#{RNA_components}")
		b
	end	
	
	def self.of_rna(array)
		b = []
		a = []
		array.each_char do |c|
			a << c if /#{RNA_components}/ =~ c
		end
		raise ArgumentError, "Not valid input" if array.size != a.size
		b = a.join("").tr("#{RNA_components}", "#{DNA_components}")
		b
	end	
	
end