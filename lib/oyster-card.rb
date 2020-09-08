class Oystercard 
  MAX_BALANCE = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :travelling, :entry_station, :exit_station, :journeys

  
  def initialize(balance=0)
    @balance = 0
    @travelling = false 
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
  end

  def top_up(amount)
    fail "The maximum is #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount 
  end



private

  def deduct(fare)
    @balance -= fare
  end

end

