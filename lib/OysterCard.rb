class OysterCard
    
    attr_reader :balance, :state
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    MIN_FARE = 1
    def initialize(balance = 0)
      @balance = balance
      @state = false
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if @balance + credit >= MAX_BALANCE
      @balance += credit
    end

    def in_journey?
      @state = false
    end
    
    def touch_in
      raise "insufficient balance" if (@balance) < MIN_BALANCE
      if @balance >= MIN_BALANCE
        @state = true
      end
    end

    def touch_out
      deduct(MIN_FARE)
      @state
    end  
    private
    def deduct(amount)
      @balance -= amount
    end  
end