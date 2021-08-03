class OysterCard
    
    attr_reader :balance, :state
    MAX_BALANCE = 90

    def initialize(balance = 0)
      @balance = balance
      @state = false
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end
    
    def deduct(amount)
      @balance -= amount
    end  

    def in_journey?
      @state = false
    end
    
    def touch_in
      @state = true
    end

    def touch_out
      @state
    end  
    
end