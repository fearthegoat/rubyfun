class Card

	attr_reader :name
	attr_reader :value
	attr_reader :suit

	def initialize(name, value, suit)
		@name = name
		@value = value
		@suit = suit
	end

	def to_s
		"#{name} of #{suit}s"
	end

end
	
class Deck

	attr_reader :dealt_cards

	def initialize
		suits = "Spade", "Club", "Diamond", "Heart"
		card_name =  "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "Jack", "Queen", "King", "Ace"
		@deck = []
		@dealt_cards = []
		suits.each do |s|
			card_name.each.with_index do | name, index|
				index += 2 # Needed since index starts at 0.  Ace is assumed to have value of 14 instead of 1
				@deck << Card.new(name, index, s)
			end
		end
		@deck
	end

	def deal_top_card
		dealt_card = @deck[0]	
		@deck -= [@deck[0]]
		@dealt_cards << dealt_card
	end	

	def deal_bottom_card
		dealt_card = @deck[-1]	
		@deck -= [@deck[-1]]
		@dealt_cards << dealt_card
	end

	def sum_of_dealt_cards
		sum = 0
		dealt_cards.each { | t | sum += t.value }
		sum
	end

	def average
		sum_of_dealt_cards / dealt_cards.count
	end

end

a = Deck.new
2.times {a.deal_top_card}
2.times {a.deal_bottom_card}
puts a.dealt_cards
puts a.average
