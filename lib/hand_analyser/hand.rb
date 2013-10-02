module HandAnalyser
  class Hand
    def initialize(hand_string)
      @cards = cards_from(hand_string)
    end

    private

    def cards_from(str)
      cards_arr = str.split(' ')
      # Remove suits from each
      cards_arr.map { |c| c[0] }
    end
  end
end
