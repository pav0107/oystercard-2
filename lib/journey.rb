class Journey

  attr_reader :entry_station, :exit_station

  # def initialize
  #   @entry_station = entry_station
  #   @exit_station = exit_station
  # end
  
  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end
end
