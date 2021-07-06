require 'oystercard'

describe Oystercard do
  describe "#initialization" do
    it "new balance is zero" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it "adds money to a new card" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

    it "adds money correctly on multiple top_ups" do 
      subject.top_up(10)
      subject.top_up(10)
      expect(subject.balance).to eq(20)
    end

    it "raises an error if balance is above 90" do
      expect { subject.top_up(100) }.to raise_error "maximum balance is 90"
    end
  end
end

