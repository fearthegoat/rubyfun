require 'date'

LAST_YEAR = {
  "may" => 124,
  "june" => 236,
  "july" => 232,
  "august" => 264,
}

THIS_YEAR = {
  "may" => 156,
  "june" => 252,
  "july" => 242,
}

weights = [0.5,0.35,0.15]


current_month = Date::MONTHNAMES[Date.today.month].downcase
i = 3
weighted_averages = []
while i >0
  month = Date::MONTHNAMES[Date.today.month-i].downcase
  weighted_averages << ( THIS_YEAR[month].to_f / LAST_YEAR[month] ) * weights[i-1]
i -= 1
end
weighted_average = weighted_averages.inject(0.0){ |result, averages| result + averages}
THIS_YEAR[current_month] = (LAST_YEAR[current_month] * weighted_average).round(0)
puts "#{current_month}: #{THIS_YEAR[current_month]}"
