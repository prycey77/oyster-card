class Journeys

  attr_accessor :travelling, :entry_station, :exit_station, :journeys

  def initialize
    
    @travelling = false 
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
  end

  def touch_in(station)
    # raise "Insufficient funds" if @balance < 1
    @travelling = true 
    @entry_station = station
    @journeys[:beginning] = station
  end


  def touch_out(station)
    @travelling = false
    @entry_station = nil
    # deduct(MINIMUM_FARE)
    @exit_station = station
    @journeys[:end] = station
end

  
  def in_journey?
    !!entry_station
  end
  

end