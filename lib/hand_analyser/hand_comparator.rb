# encoding: utf-8
#
module HandAnalyser
  class SplitPotError < StandardError; end
  module HandComparator
    include Comparable

    def <=>(other)
      if score != other.score
        score <=> other.score
      else
        case
        when score == 0 then high_card_comparator(other)
        when score == 1 then pair_comparator(other)
        else
          # Pending
        end
      end
    end

    private

    def high_card_comparator(other)
      comparator = nil
      unsuited_cards.each_with_index do |card, index|
        next unless comparator.nil?
        mine = card_to_numeric(card)
        theirs = card_to_numeric(other.unsuited_cards[index])
        if mine != theirs
          comparator = (mine <=> theirs)
        end
      end
      raise SplitPotError if comparator.nil?
      comparator
    end
  end
end
