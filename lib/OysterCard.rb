class OysterCard
    
  attr_reader :balance, :entry_station, :journey_log, :journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  def initialize(balance = 0)
    @balance = balance
     @journey_log = []
     @journey = nil
  end
 
  def top_up(credit)
    raise 'Cannot exceed maximum amount £90' if @balance + credit >= MAX_BALANCE
    @balance += credit
  end

  #  def in_journey?
  #   !!entry_station
  #  end
  
  def touch_in(station)
    raise "insufficient balance" if @balance < MIN_BALANCE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    save_journey(@entry_station, station)
    @journey.end_journey 
    deduct(@journey.fare)
  end  
  
  private
  def deduct(amount)
    @balance -= amount
  end  
  def save_journey(station1, station2)
    @journey_log.push({entry: station1, exit: station2})
  end
end

