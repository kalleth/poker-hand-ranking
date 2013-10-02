require_relative '../spec_helper'

describe "HandAnalyser::Hand" do
  let(:high_card) { HandAnalyser::Hand.new('AS 9H 2D 5C 7H') }
  let(:pair) { HandAnalyser::Hand.new('AS AH 2D 5C 7H') }
  let(:two_pair) { HandAnalyser::Hand.new('AS AH 2D 2C 7H') }
  let(:three_of_a_kind) { HandAnalyser::Hand.new('AS AH AD 5C 7H') }
  let(:straight) { HandAnalyser::Hand.new('AS KH QD JC TH') }
  let(:flush) { HandAnalyser::Hand.new('9H AH 2H 5H 7H') }
  let(:full_house) { HandAnalyser::Hand.new('AS AH 2D 2H 2C') }
  let(:quads) { HandAnalyser::Hand.new('AS AH AD AC 7H') }
  let(:straight_flush) { HandAnalyser::Hand.new('AS KS QS JS TS') }

  context "when identifying single hands" do
    it "correctly scores a high card" do
      expect(high_card.score).to be(0)
    end

    it "correctly scores a pair" do
      expect(pair.score).to be(1)
    end

    it "correctly scores two pairs" do
      expect(two_pair.score).to be(2)
    end

    it "correctly scores three of a kind" do
      expect(three_of_a_kind.score).to be(3)
    end

    it "correctly scores a straight" do
      expect(straight.score).to be(4)
    end

    it "correctly scores a flush" do
      expect(flush.score).to be(5)
    end

    it "correctly scores a full house" do
      expect(full_house.score).to be(6)
    end

    it "correctly scores quads" do
      expect(quads.score).to be(7)
    end

    it "correctly scores a straight flush" do
      expect(straight_flush.score).to be(8)
    end
  end

  context "when comparing different hands" do
    it "shows a flush better than a straight" do
      expect(flush > straight).to be(true)
    end

    it "shows a straight not better than a flush" do
      expect(straight > flush).to be(false)
    end

    it "shows quads better than a pair" do
      expect(quads > pair).to be(true)
    end

    it "shows pair worse than quads" do
      expect(pair > quads).to be(false)
    end
  end

  context "when comparing the same hand with different high points" do
    let(:pair_kings) { HandAnalyser::Hand.new('KS KH 2D 5C 7H') }
    let(:high_card_king) { HandAnalyser::Hand.new('KS 9H 2D 5C 7H') }

    it "shows pair of aces better than pair of kings" do
      expect(pair_kings < pair_aces).to be(true)
    end

    it "shows high card A better than high card K" do
      expect(high_card > high_card_king).to be(true)
    end
  end

end
