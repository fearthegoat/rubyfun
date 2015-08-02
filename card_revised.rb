require 'forwardable'
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

class StackOfCards
	include Enumerable
  
  extend Forwardable
  # def_delegator :@cards, :shuffle
  def_delegator :@cards, :<<
  # def_delegator :@cards, :to_s
  
	def initialize
		@cards = []
	end

	def sum
		each do |t|
			t.each do |card|
			puts card.class
			end
		end
		sum
		# inject(0) { |result, t| result + t.value }
	end
	
	def each
		@cards.each { |card| yield card }
	end
	
	def shuffle
		@cards.shuffle!
	end

end

class Deck < StackOfCards

	attr_reader :player_hand
	attr_reader :dealer_hand
	attr_reader :dealt_cards

	def initialize
		suits = "Spade", "Club", "Diamond", "Heart"
		card_name =  "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "Jack", "Queen", "King", "Ace"
		@cards = []
		@dealt_cards = []
		suits.each do |s|
			card_name.each.with_index do | name, index|
				index += 2 # Needed since index starts at 0.  Ace is assumed to have value of 14 instead of 1
				@cards << Card.new(name, index, s)
			end
		end
		@cards
	end

	def deal_top_card
		dealt_card = @cards[0]	
		@cards -= [@cards[0]]
		dealt_card
	end	

	def deal_bottom_card
		dealt_card = @cards[-1]	
		@cards -= [@cards[-1]]
		@dealt_cards << dealt_card
		# puts "#{calculate_card.round(2)}% chance your next card will increase your average value"
	end

	def sum_of_dealt_cards
		sum = 0.0
		dealt_cards.each { | t | sum += t.value }
		puts sum
	end

	def average
		sum_of_dealt_cards / dealt_cards.count
	end

	def calculate_card
		aggregator = 0
		@cards.each do |card|
			card.value > average ? aggregator += 1 : nil
		end
		(aggregator.to_f / @cards.count.to_f) * 100
	end

	def report
		puts "you have been dealt #{dealt_cards.count} cards"
		puts "the average of your dealt cards is: #{average.round(2)}"
		puts "There is a #{calculate_card.round(2)}% chance your next card will increase your average value"
	end

	def deal_cards(*players, number_of_cards)
		raise ArgumentError,"number_of_cards must be a Fixnum" if number_of_cards.class != Fixnum	
		players.each do |player|	
			player << number_of_cards.times.collect { deal_top_card }
		end
		players.each do |player|
			puts player.class # StackOfCards  
			player.each do |card| 
				puts card.class # Array
				card.each do |card|
					puts card.class # Card
				end
			end
		end
		# counter = 0
		# dealer_hand << number_of_cards.times.collect { deal_top_card }
		# puts dealer_hand
		# puts ""
		# player_hand << number_of_cards.times.collect { deal_top_card }
		# puts player_hand
		# # @cards.each do | card |
		# # 	card.value >= dealer_hand.first.value ? something : other
		# until player_hand.sum >= 21
		# 	player_hand << deal_top_card
		# end		

		# until dealer_hand.sum >= 21 || dealer_hand.sum >= 16
		#  	dealer_hand << deal_top_card
		# end

			#assimilate values of remaining cards. I.E 3 2's, 4 4's etc...
	end
end

class Hand < StackOfCards

	def initialize
	end

	def draw_card
	end

end

a = Deck.new
dealer = StackOfCards.new
rich_guy = StackOfCards.new
a.shuffle
a.deal_cards(rich_guy,dealer, 2)


