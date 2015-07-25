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
number_of_days_at_casino = 2000
number_of_days_at_casino.times do
	player = Player.new
	5000.times do
		player.bet('red',5)
	end
	individual_results << player.cash
end
sum = individual_results.inject(0.0) { | sum, result | sum + result}
average = sum / number_of_days_at_casino

puts "$#{average}"



individual_results = []
number_of_days_at_casino.times do
	smart_player = Player.new
	5000.times do
		smart_player.smart_bet
	end
	individual_results << smart_player.cash
end

sum = individual_results.inject(0.0) { | sum, result | sum + result}
average = sum / number_of_days_at_casino

puts "$#{average}"

