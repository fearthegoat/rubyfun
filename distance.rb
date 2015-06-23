sites_in_rome = [
  {:name=>"Pantheon", :lat=>41.8986, :long=>12.4768},
  {:name=>"St-Peters-Basillica", :lat=>41.9022, :long=>12.4533},
  {:name=>"Statue", :lat=>42.1959, :long=>12.4871},
  {:name=>"Fountain", :lat=>41.7501, :long=>12.5285},
  {:name=>"Ruin", :lat=>41.8591, :long=>12.4912},
  {:name=>"Column", :lat=>42.2921, :long=>12.4728},
  {:name=>"Park", :lat=>42.1259, :long=>12.1291},
  {:name=>"Monument", :lat=>41.9182, :long=>12.5012},
  {:name=>"Museum", :lat=>41.8102, :long=>12.5192},
  {:name=>"Obelisk", :lat=>42.1210, :long=>12.4512}
]

puts "Insert your latitude"
latitude  = gets
puts  "Insert your longitude"
longitude = gets

location = {
  lat: latitude,
  long: longitude
}

destination = []

def distance(loc1, loc2)
  radians_per_degree = Math::PI / 180
  earth_radius_in_km = 6371
  earth_radius_in_m  = earth_radius_in_km * 1000

  dlat_rad = (loc2[:lat] - loc1[:lat]) * radians_per_degree  # Delta, converted to rad
  dlon_rad = (loc2[:long] - loc1[:long]) * radians_per_degree

  lat1_rad, lon1_rad = loc1.map {|i| i * radians_per_degree }
  lat2_rad, lon2_rad = loc2.map {|i| i * radians_per_degree }

  a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  earth_radius_in_m * c
end


def distance_from_locations(starting_location, site_locations)
  site_locations.map do |site_location|
    distance(starting_location, site_location)
  end
end

distances_in_rome = distance_from_locations(location, sites_in_rome)

puts distances_in_rome.sort