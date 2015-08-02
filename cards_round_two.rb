class Card

	attr_accessor :value
	attr_reader :name

	def initialize(name, value, suit)
		@name = name
		@suit = suit
		@value = value
	end

	def to_s
		"#{@name} of #{@suit}"
	end
end

class StackOfCards

	def initialize
		@cards = []
	end
	
	def shuffle
		@cards.shuffle!
	end

	def add_card(card)
		@cards << card
	end

	def set_ace_value_to_1
		ace_cards = []
		@cards.each do |card|
			card.value = 1 if card.name == "Ace"
		end
	end
	
	def a_pair?
		a_pair = []
		@cards.each do |card|
			a_pair << card.name
		end
		a_pair[0] == a_pair[1]
	end

  def ace_present?
  	@cards.each do |card|
			return true if card.name == "Ace"	
		end
		return false
	end

	def blackjack?
		return true if @cards.total_value == 21 && @cards.size == 2
		else 
			return false
	end

	def total_value
		@cards.inject(0) { |total, card| total + card.value }
	end

	def deal_off_top_to(other_stack, number_of_cards = 1)
		number_of_cards.times do
			card = @cards.shift
			other_stack.add_card(card)
		end
	end

	def to_s
		puts @cards.map { |c| c.to_s }.join(', ')
	end
end


class Deck < StackOfCards
	SUITS = "Spade", "Club", "Diamond", "Heart"
	NAMES =  "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "Jack", "Queen", "King", "Ace"


	def initialize
		super # "super" will call the parent version of initialize (e.g. initialize defined in StackOfCards)

		SUITS.each do |s|
			NAMES.each.with_index do | name, index|
				index += 2 # Needed since index starts at 0.  Ace is assumed to have value of 14 instead of 1
				index >= 10 ? index = 10 : index  #doesn't solve the Ace problem.
				name == "Ace" ? index = 11 : nil
				@cards << Card.new(name, index, s)
			end
		end
		@cards
	end

end

@dealer = StackOfCards.new
@player_1 = StackOfCards.new

@deck = Deck.new
@deck.shuffle

@deck.deal_off_top_to(@dealer, 1)
@deck.deal_off_top_to(@player_1, 2)


def build_player_hand_with_no_ace
	if @player_1.total_value >= 17 ||	@player_1.total_value >= 13 && @dealer.total_value <= 6 || @player_1.total_value == 12 && @dealer.total_value <= 6 && @dealer.total_value >= 4
		return
	else 
		@deck.deal_off_top_to(@player_1, 1)
		build_player_hand_with_ace and return if @player_1.ace_present?
		build_player_hand_with_no_ace
		return
	end
end

def build_player_hand_with_ace
	
	if @player_1.ace_present? && @player_1.total_value >= 22
 		@player_1.set_ace_value_to_1 
 		build_player_hand_with_no_ace
 		return
	end
	if @player_1.total_value >= 19 ||	@player_1.total_value >= 18 && @dealer.total_value <= 8 
		return
	else
		@deck.deal_off_top_to(@player_1, 1)
		build_player_hand_with_ace
	end
end

def pair_splitting
	if @player_1.a_pair?
	@player_1.split("") unless @player_1.total_value == 20 || @player_1.total_value == 18 && (@dealer.total_value == 7 || @dealer.total_value >=10) || @player_1.total_value <= 14 && @dealer.total_value >=8 || @player_1.total_value == 10 || @player_1.total_value ==8 && @dealer.total_value <=4 || @player_1.total_value <= 12 && @player_1.total_value >= 8 && @dealer.total_value == 7
	end
end


if @player_1.ace_present? 
	build_player_hand_with_ace	
	else	
	build_player_hand_with_no_ace
end

while @dealer.total_value < 16 
	@deck.deal_off_top_to(@dealer, 1)
end
#fix dealer ace handling

puts "dealer: "
puts "#{(@dealer).to_s}"
puts "dealer.total_value: #{(@dealer.total_value).to_s}"
puts ""
puts "player_1: "
puts "#{(@player_1).to_s}"
puts "player_1.total_value: #{(@player_1.total_value).to_s}"

