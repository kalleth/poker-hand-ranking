module HandAnalyser
  class Hand
    def initialize(hand_string)
      @cards = cards_from(hand_string)
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

    def is_straight_flush?
    end

    def is_quads?
    end

    def is_full_house?
    end

    def is_flush?
    end
    
    def is_straight?
    end
    
    def is_three_of_a_kind?
    end

    def is_two_pair?
    end

    def is_pair?
    end

    def cards_from(str)
      cards_arr = str.split(' ')
      # Remove suits from each
      cards_arr.map { |c| c[0] }
    end
  end
end
