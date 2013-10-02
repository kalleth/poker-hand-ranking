module HandAnalyser
  class Hand
    def initialize(hand_string)
      @cards = hand_string.split(' ') 
    end

    def score
      case
      when straight_flush?   then 8 
      when quads?            then 7
      when full_house?       then 6
      when flush?            then 5
      when straight?         then 4
      when three_of_a_kind?  then 3
      when two_pair?         then 2
      when pair?             then 1
      else 0
      end
    end

    private

    def unsuited_cards
      @unsuited_cards ||= @cards.map { |c| c[0] }
    end

    def straight_flush?
      straight? && flush?
    end

    def quads?
      has_same?(4)
    end

    def full_house?
    end

    def flush?
    end
    
    def straight?
    end
    
    def three_of_a_kind?
      has_same?(3)
    end

    def two_pair?
      has_same?(3, 1)
    end

    def pair?
      has_same?(2)
    end

    def has_same?(n, greater_than = 0)
      unsuited_cards.select { |e| unsuited_cards.count(e) >= n }.uniq.size > greater_than 
    end
  end
end
