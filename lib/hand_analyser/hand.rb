module HandAnalyser
  class Hand
    include Comparable

    def <=>(other)
      if score != other.score
        score <=> other.score
      else
        # Pending
      end
    end

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

    # Utility methods
    
    def card_to_numeric(c)
      return c.to_i unless c.to_i == 0
      case c
      when "T" then 10
      when "J" then 11
      when "Q" then 12
      when "K" then 13
      when "A" then 14
      end
    end
    
    def unsuited_cards
      @unsuited_cards ||= @cards.map { |c| c[0] }.sort_by do |a, b|
        card_to_numeric(a) <=> card_to_numeric(b)
      end
    end

    def has_same?(n, greater_than = 0)
      unsuited_cards.select { |e| unsuited_cards.count(e) >= n }.uniq.size > greater_than 
    end

    # Hand identification methods
    # (aka 'Business Logic')

    def straight_flush?
      straight? && flush?
    end

    def quads?
      has_same?(4)
    end

    def full_house?
      unsuited_cards.select { |e| unsuited_cards.count(e) == 2 }.uniq.size == 1 &&
        unsuited_cards.select { |e| unsuited_cards.count(e) == 3 }.uniq.size == 1
    end

    def flush?
      @cards.map { |c| c[1] }.uniq.size == 1
    end
    
    def straight?
      range_arr = unsuited_cards.map { |c| card_to_numeric(c) }
      range = Range.new(range_arr.last, range_arr.first)
      ((range.max - range.min) + 1) == 5
    end
    
    def three_of_a_kind?
      has_same?(3)
    end

    def two_pair?
      has_same?(2, 1)
    end

    def pair?
      has_same?(2)
    end
  end
end
