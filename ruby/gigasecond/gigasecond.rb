class Gigasecond
	def self.from
		gs = 10**9
		seconds_in_year = 60 * 60 * 24 * 365
		gs_in_minutes = gs / 60
		gs_in_hours = gs / ( 60 * 60 )
		gs_in_days = gs / ( 60 * 60 * 24 )
		gs_in_years = (gs / seconds_in_year.to_f)
		gs_days = ( gs_in_years - gs_in_years.floor ) * 365
		gs_hours = (gs_days - gs_days.floor) * 24
		puts "#{gs_in_years.floor} years and #{gs_days.floor} days and #{gs_hours} hours"
	end
VERSION = 1
end
Gigasecond.from