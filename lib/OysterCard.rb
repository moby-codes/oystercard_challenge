class OysterCard 
  attr_reader :balance, :journey_log, :journey
  
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
     @journey_log = []
     @journey = nil
  end
 
  def top_up(credit)
    check_limit(credit)
    @balance += credit
  end

  def touch_in(station)
    deduct(@journey.fare) if @journey != nil
    check_balance
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey == nil
    @journey_log << @journey.end_journey(station)
    deduct(@journey.fare)
    @journey = nil
  end  
  
  private

  def deduct(amount)
    @balance -= amount
  end
  
  def check_balance
    raise "insufficient balance" if @balance < MIN_BALANCE
  end

  def check_limit(credit)
    message = "Cannot exceed maximum amount #{OysterCard::MAX_BALANCE}"
    raise message if @balance + credit > MAX_BALANCE
  end
end

