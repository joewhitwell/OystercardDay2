require "oystercard.rb"

describe Oystercard do

let (:oystercard) {Oystercard.new}

describe "#balance" do
    it "has a balance" do
    expect(oystercard.balance).to eq 0
    end

    it "will top up balance" do
    oystercard.top_up(17)
    expect(oystercard.balance).to eq 17
    end
end

describe "#top_up" do
    it "will raise an error if new balance exceeds £90 limit" do
    expect{oystercard.top_up(91)}.to raise_error("Balance £91, Limit exceeded")
  end
end

describe "#deduct" do
  it "will deduct from 0 tp minus1" do
    oystercard.deduct(1)
    expect(oystercard.balance).to eq -1
  end
end

describe "#touch_in" do
  it "marks in_use as true" do
    oystercard.touch_in
    expect(oystercard.in_use).to eq true
  end
end

describe "#touch_out" do
  it "marks in_use as false" do
    oystercard.touch_out
    expect(oystercard.in_use).to eq false
  end
end

describe "#in_journey?" do
  it "marks a card as being in a journey after touch_in" do
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it "marks a card as not being in a journey after touch_out" do
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end
end


end
