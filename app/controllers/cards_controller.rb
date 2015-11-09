class CardsController < ApplicationController

  def game
    # Retrieves the string representations of the cards
    @cards = get_cards(Card.count).shuffle
  end

  # Route that searches for a set in a list of cards
  def get_set
    @set = { set: find_a_set(params[:cards]) }
  end

  # Route the displays the winner
  def winner
    @winner = params[:name]
    if @winner.include? ","
      @winner = params[:name].gsub ',', ' and '
      @winner += "<br/> WIN!"
    else
      @winner += "<br/> WINS!"
    end
    @winner
  end

  private

    # Get's the string representations of an ammount of cards
    def get_cards(num)
      list = Card.order("RANDOM()").limit(num).map do |c|
        c.number + " " + c.color + " " + c.shading + " " + c.shape + (c.number == "one" ? "" : "s")
      end
    end

    # Checks if 3 cards make up a set
    def is_set(list)
      cards = list.map do |c|
        parse_card_string(c)
      end
      has_one_common = false
      cards.transpose.each do |col|
        if col.uniq.length != 1 && col.uniq.length != col.length then
          return false
        end
      end

      true
    end

    # Breaks down the string representation into it's components
    def parse_card_string(card)
      params = card.split
      if params[0] != "one" then
        params[3] = params[3].chomp('s')
      end
      params
    end

    # Uses the built in "combination" method that tries every combination of 3 cards to find a set
    # If it fails to find a set, it returns an empty array
    def find_a_set(cards)
      combinations = cards.combination(3).to_a
      for c in combinations
        if is_set(c)
          return c
        end
      end
      []
    end
end
