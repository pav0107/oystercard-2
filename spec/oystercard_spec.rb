require 'oystercard'

describe Oystercard do
  describe "#initialization" do
    it "new balance is zero" do
      expect(subject.balance).to eq(0)
    end
  end
end

