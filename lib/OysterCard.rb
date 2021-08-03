class OysterCard
    
    attr_reader :balance, :state, :entry_station
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    MIN_FARE = 1
    def initialize(balance = 0)
      @balance = balance
      @state = false
      @entry_station = ""
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if @balance + credit >= MAX_BALANCE
      @balance += credit
    end

    def in_journey?
      #!!entry_station
      @state = false
    end
    
    def touch_in(station)
      raise "insufficient balance" if @balance < MIN_BALANCE
      if @balance >= MIN_BALANCE
        @state = true
      end
      @entry_station = station
    end

    def touch_out
      deduct(MIN_FARE)
      @state
      @entry_station = nil
    end  
    private
    def deduct(amount)
      @balance -= amount
    end  
end