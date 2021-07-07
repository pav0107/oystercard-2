require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station, zone: 1}
  let(:exit_station) { double :exit_station, zone: 2}

  describe 'station record' do
    it 'responds to start journey' do
      expect(subject).to respond_to(:start).with(1).argument
    end

    it 'has the entry station' do
      subject.start(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end

    it 'responds to finish journey' do
      expect(subject).to respond_to(:finish).with(1).argument
    end

    it 'has the exit station' do
      subject.finish(exit_station)
      expect(subject.exit_station).to eq(exit_station)
    end
  end

  describe 'the journey' do
    it 'is in journey' do
      subject.start(entry_station)
      expect(subject.complete?).to eq(false)
    end

    it 'has completed the journey' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.complete?).to eq(true)
    end
  end

  describe 'the cost of the journey' do
    it 'sets fare to £1 for a completed journey' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare).to eq(Journey::MIN_FARE)
    end

    it 'sets charge to £6 if exit station but no entry station' do
      subject.finish(exit_station)
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end

    it 'sets charge to £6 if entry station but no exit station' do
      subject.start(entry_station)
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end

end