class Journey

  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end
  
  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  def fare
    return MIN_FARE if complete?
    return PENALTY_FARE if !@entry_station && !!@exit_station
    return PENALTY_FARE if !@exit_station && !!@entry_station
  end
end
