class OysterCard
    
    attr_reader :balance, :entry_station
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    MIN_FARE = 1
    def initialize(balance = 0)
      @balance = balance
      @entry_station = nil
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

    def touch_out
      deduct(MIN_FARE)
      @entry_station = nil
    end  
    private
    def deduct(amount)
      @balance -= amount
    end  
end