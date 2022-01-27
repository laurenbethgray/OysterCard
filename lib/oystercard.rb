
class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 10

  def initialize
    @balance = 0
    # @journeys = []
  end

  def top_up(amount)
    raise "Card limit exceeded." if (self.balance + amount) > MAX_BALANCE
    @balance += amount
  end

  # def in_journey?
  #   @entry_station
  # end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in." if self.balance < MIN_BALANCE
    @entry_station = entry_station
    # @journeys << { :entry => entry_station, :exit => exit_station }
  end

  def touch_out(exit_station)
    deduct
    @exit_station = exit_station
    # @journeys[-1][:exit] = exit_station
    @entry_station = nil
  end
  
private

  def deduct
    @balance -= MIN_CHARGE
  end
end