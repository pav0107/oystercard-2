class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "maximum balance is 90" if max_value?(amount)
    
    @balance += amount
  end

  private

  def max_value?(amount)
    @balance + amount > 90
  end

end