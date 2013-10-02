module HandAnalyser
  class Hand
    def initialize(hand_string)
      @cards = hand_string.split(' ') 
    end

    def score
      case
      when is_straight_flush?   then 8 
      when is_quads?            then 7
      when is_full_house?       then 6
      when is_flush?            then 5
      when is_straight?         then 4
      when is_three_of_a_kind?  then 3
      when is_two_pair?         then 2
      when is_pair?             then 1
      else 0
      end
    end

    private

    def unsuited_cards
      @unsuited_cards ||= @cards.map { |c| c[0] }
    end

    def is_straight_flush?
    end

    def is_quads?
      unsuited_cards.select { |e| unsuited_cards.count(e) > 3 }.uniq.size > 0
    end

    def is_full_house?
    end

    def is_flush?
    end
    
    def is_straight?
    end
    
    def is_three_of_a_kind?
      unsuited_cards.select { |e| unsuited_cards.count(e) > 2 }.uniq.size > 0
    end

    def is_two_pair?
      unsuited_cards.select { |e| unsuited_cards.count(e) > 1 }.uniq.size > 1
    end

    def is_pair?
      unsuited_cards.select { |e| unsuited_cards.count(e) > 1 }.uniq.size > 0
    end
  end
end
