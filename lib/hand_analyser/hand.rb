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
      has_same?(4)
    end

    def is_full_house?
    end

    def is_flush?
    end
    
    def is_straight?
    end
    
    def is_three_of_a_kind?
      has_same?(3)
    end

    def is_two_pair?
      has_same?(3, 1)
    end

    def is_pair?
      has_same?(2)
    end

    def has_same?(n, greater_than = 0)
      unsuited_cards.select { |e| unsuited_cards.count(e) >= n }.uniq.size > greater_than 
    end
  end
end
