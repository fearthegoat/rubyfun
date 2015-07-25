class RouletteWheel
	def initialize
		@wheel = (0..36).to_a + [0]
	end

	def roll(bet)
		if bet.class == String
			roll_for_color(bet)
		else
			roll_for_number(bet)
		end
	end

	# def roll_for_number(bet)
	# 	@wheel.sample == bet


	# end

	def roll_for_color(bet)
		result = @wheel.sample

		if result == 0
			color = 'green'
		elsif result%2 == 0
			color = 'black'
		else
			color = 'red'
		end
		color == bet
	end
end



class Player

	attr_reader :cash

	def initialize
		@cash = 10000
		@wheel = RouletteWheel.new
		@last_bet_amount = 5
		@last_bet_result = false
	end

	def bet(bet, amount)
		# puts "@cash: #{(@cash).to_s}"
		# puts "@last_bet_result: #{(@last_bet_result).to_s}"
		# puts "amount: #{(amount).to_s}"
		@last_bet_amount = amount

		@cash -= amount

		if @last_bet_result = @wheel.roll(bet)
			@cash += amount*2
		end
	end

	def smart_bet
		if @last_bet_result
			bet('red', 5)
		else
			if @last_bet_amount >= 40
				bet('red', 5)
			else
				bet('red', @last_bet_amount*2)
			end
		end
	end
end

individual_results = []
cash = 10000
won_money_for_day = []
games_play_per_day = 1000
lost_money_for_day = []
number_of_days_at_casino = 2000	
number_of_days_at_casino.times do
	player = Player.new
	games_play_per_day.times do
		player.bet('red',10)
	end
	individual_results << player.cash
end
individual_results.each do |result| 
	if result >= cash 
		won_money_for_day << result 
	else
		lost_money_for_day << result
	end
end
sum = individual_results.inject(0.0) { | sum, result | sum + result}
normal_average = sum / number_of_days_at_casino
percent_of_good_days = (won_money_for_day.size.to_f / number_of_days_at_casino) * 100
total_won = (won_money_for_day.inject(0.0) { | total, result | total + result }) - cash * won_money_for_day.size
total_lost = ((lost_money_for_day.inject(0.0) { | total, result | total + result }) - cash * lost_money_for_day.size)*-1

variance = (individual_results.inject(0.0) { | total, result | total + (normal_average - result)**2}) / individual_results.size
puts "After #{number_of_days_at_casino} days at the casino and playing #{games_play_per_day} games per day, your results were:"
puts ""
puts "$#{normal_average} average ending cash balance. ($#{cash} starting)"
puts "#{percent_of_good_days.round(1)} percent of time you beat the casino."
puts "$#{Math.sqrt(variance).round(2)} standard deviation of the days."
puts "$#{individual_results.max-cash} is the most you won in a day, $#{cash-individual_results.min} is the most you lost in a day. "
puts "#{(total_won/total_lost).round(5)} ratio of won money to lost money"
puts ""
puts "...still calculating, please wait..."

individual_results = []
number_of_days_at_casino.times do
	smart_player = Player.new
	games_play_per_day.times do
		smart_player.smart_bet
	end
	individual_results << smart_player.cash
end

sum = individual_results.inject(0.0) { | sum, result | sum + result}
average = sum / number_of_days_at_casino
puts ""
puts "Mark's Roulette Strategy:"
puts "$#{average.round(2)} average ending cash balance. ($#{cash} starting)"
puts "$#{(average-normal_average).round(2)} average loss compared to playing normally."

