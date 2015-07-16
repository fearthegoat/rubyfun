class Deck
	
	def initialize
		suits = "Spade", "Club", "Diamond", "Heart"
		card_name =  "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "Jack", "Queen", "King", "Ace"
		@@deck = []
		suits.each do |s|
			card_name.each.with_index do | name, index|
				index += 2 # Needed since index starts at 0.  Ace is assumed to have value of 14 instead of 1
			@@deck << {"suit" => s, "name" => name, "value"=> index}
			end
		end
		 @@deck
	end

	def self.shuffle_deck
		Deck.new
		@@deck.shuffle!
	end
	
end

class Card < Deck
	
	Deck.shuffle_deck #creates and shuffles deck

	#setting initial values
	@count_cards_dealt_top = 0
	@count_cards_dealt_bottom = 0
	
	#troubleshooting checks
	puts "bottom card #{@@deck[-1]}"  
	puts "second bottom card #{@@deck[-2]}"
	puts "top card #{@@deck[0]}"


	def self.deal_top_card		
		unless cards_remaining <= 0
			puts @@deck[@count_cards_dealt_top]
			@count_cards_dealt_top += 1
		else 
		 puts "no more cards remaining in deck"
		end	
	end

	def self.deal_bottom_card
		unless cards_remaining <= 0
			puts @@deck[( @count_cards_dealt_bottom + 1) * -1] #needed since the last card in array is -1
			@count_cards_dealt_bottom += 1
		else 
		 puts "no more cards remaining in deck"
		end	
	end
	
	def self.cards_remaining
		@@deck.count - @count_cards_dealt_bottom - @count_cards_dealt_top
	end

1.times {Card.deal_bottom_card}
1.times {Card.deal_top_card}
1.times {Card.deal_bottom_card}

end
