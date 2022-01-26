class Oystercard

  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 10

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Card limit of #{MAX_BALANCE} exceeded." if (self.balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    # if @in_use == true
    #   return true
    # elsif @in_use == false
    #   return false 
    # end
    @entry_station != nil
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in." if self.balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out

    deduct
  end
  
private

  def deduct
    @balance -= MIN_CHARGE
  end
end