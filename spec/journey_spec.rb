require 'journey'

describe Journey do
  let(:entry_station) { double(Station.new("Brixton", 2))}
  let(:exit_station) { double(Station.new("Victoria", 1))}

  describe 'station journery' do
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
end