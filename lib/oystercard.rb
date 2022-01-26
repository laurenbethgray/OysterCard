class Oystercard

  attr_reader :balance
  attr_reader :in_use
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 10

  def initialize
    @balance = 0
    @in_use = false 
  end

  def top_up(amount)
    raise "Card limit of #{MAX_BALANCE} exceeded." if (self.balance + amount) > MAX_BALANCE
    @balance += amount
  end

  # def in_journey?
  #   @in_use 
  # end

  def in_journey?
    if @in_use == true
      return true
    elsif @in_use == false
      return false 
    end
  end

  def touch_in
    raise "Insufficient balance to touch in." if self.balance < MIN_BALANCE
    @in_use = true
  end

  def touch_out
    @in_use = false
    deduct
  end
  
private

  # def deduct(fare)
  #   @balance -= fare
  # end

  def deduct
    @balance -= MIN_CHARGE
  end
end