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

  it "correctly identifies a pair" do
    expect(pair.type).to be(:pair)
  end
end
