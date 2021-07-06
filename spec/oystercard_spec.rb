require 'oystercard'

describe Oystercard do
  describe "#initialization" do
    it "new balance is zero" do
      expect(subject.balance).to eq(0)
    end

    it "adds empty journey history" do
      expect(subject.journey_history).to eq []
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

    it "raises an error if balance is above CARD_LIMIT" do
      expect { subject.top_up(100) }.to raise_error "maximum balance is £#{Oystercard::CARD_LIMIT}"
    end
  end

  describe "#deduct" do
    xit "deducts money from a card" do
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq(5)
    end
  end

  describe "if in use" do
    let(:station) { double :station}
    it "checks if user can touch" do
      expect(subject).to respond_to(:touch_in)
    end

    it "checks if user has touched in" do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq(station)
    end

    it "raises an error if balance is below card minimum" do
      expect {subject.touch_in(station)}.to raise_error "minimum balance is #{Oystercard::CARD_MINIMUM}"
    end

    it "is in use" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end

    it "checks if user can touch out" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject).to respond_to(:touch_out)
    end

    it "checks if user has touched out" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to eq(false)
    end



    it "deducts £1 after the touch out" do
      subject.top_up(10)
      subject.touch_in(station)
      expect {subject.touch_out(station)}.to change{subject.balance}.by(-1)
    end
  end

  describe "saving journey info" do
    let(:station1) { double :station1}
    let(:station2) { double :station2}
    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(station1)
      expect(subject.entry_station).to eq station1
    end
    
    it "stores the exit station" do 
      subject.top_up(10)
      subject.touch_in(station1)
      subject.touch_out(station2)
      expect(subject.exit_station).to eq station2
    end

    it "checks if a journey has been created" do
      subject.top_up(10)
      subject.touch_in(station1)
      subject.touch_out(station2)
      expect(subject.journey_history).to eq([{entry_station: station1, exit_station: station2}])
    end
  end
end

