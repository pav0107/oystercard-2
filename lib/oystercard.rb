require_relative './journey.rb'

class Oystercard
  CARD_LIMIT = 90
  CARD_MINIMUM = 1  
  attr_reader :balance, :entry_station, :exit_station, :journey_history, :current_journey

  def initialize
    @balance = 0
    @journey_history =[]
    @current_journey = nil
  end

  def top_up(amount)
    fail "maximum balance is £#{CARD_LIMIT}" if max_value?(amount)
    
    @balance += amount
  end

  def touch_in(station)
    fail "minimum balance is #{CARD_MINIMUM}" if balance < CARD_MINIMUM 
    @current_journey = Journey.new(station)
    @entry_station = station
  end

  def touch_out(station)
    deduct(1)
    @current_journey.finish(station)
    journey_history << { entry_station: @current_journey.entry_station, exit_station: @current_journey.exit_station}
  end

  private

  def max_value?(amount)
    @balance + amount > CARD_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

end

