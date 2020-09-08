class Oystercard 
  MAX_BALANCE = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :travelling
  
  def initialize(balance=0)
    @balance = 0
    @travelling = false 
    
  end

  def top_up(amount)
    fail "The maximum is #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount 
  end

  def in_journey?
    @travelling
  end
  
  def touch_in(station)
    raise "Insufficient funds" if @balance < 1
    @travelling = true 
  end

  def touch_out
      @travelling = false
      deduct(MINIMUM_FARE)
  end

private

  def deduct(fare)
    @balance -= fare
  end

end