class Journey

  attr_reader :entry_station, :exit_station

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
    return 1 if complete?
    return 6 if !@entry_station && !!@exit_station
    return 6 if !@exit_station && !!@entry_station
  end
end
