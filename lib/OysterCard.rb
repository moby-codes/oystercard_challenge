class OysterCard
    
  attr_reader :balance, :entry_station, :journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journey = []

  end
 
  def top_up(credit)
    raise 'Cannot exceed maximum amount £90' if @balance + credit >= MAX_BALANCE
    @balance += credit
  end

  def in_journey?
    !!entry_station
  end
  
  def touch_in(station)
    raise "insufficient balance" if @balance < MIN_BALANCE
    if @balance >= MIN_BALANCE
      @entry_station
    end
    @entry_station = station
  end

  def touch_out(station)
    save_journey(@entry_station, station)
    @entry_station = nil  
    deduct(MIN_FARE)
  end  
  
  private
  def deduct(amount)
    @balance -= amount
  end  
  def save_journey(station1, station2)
    @journey.push({entry: station1, exit: station2})
  end
end

