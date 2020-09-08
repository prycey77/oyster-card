class Oystercard 
  MAX_BALANCE = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :travelling, :entry_station, :exit_station
  
  def initialize(balance=0)
    @balance = 0
    @travelling = false 
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    fail "The maximum is #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount 
  end

  def in_journey?
    !!entry_station
  end
  
  def touch_in(station)
    raise "Insufficient funds" if @balance < 1
    @travelling = true 
    @entry_station = station
  end

  def touch_out(station)
      @travelling = false
      @entry_station = nil
      deduct(MINIMUM_FARE)
      @exit_station = station
  end

private

  def deduct(fare)
    @balance -= fare
  end

end

