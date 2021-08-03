require 'OysterCard'

describe OysterCard do

    it 'should show balance of zero' do
      expect(subject.balance).to eq(0)
    end

    it 'should add to the balance' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
    
    it 'the maximum balance should be 90' do
      expect(OysterCard::MAX_BALANCE).to eq(90)
    end
   
    it 'Raises an error when topup exceeds maximum value' do
       subject.top_up(89) 
       expect { subject.top_up(1) }.to raise_error('Cannot exceed maximum amount £90')
    end
    
    describe 'Test the deduct method exists' do
      it { is_expected.to respond_to(:deduct) }
    end
    
    it 'Deducts £2 from the balance when deduct is called' do
      subject.top_up(4)
      expect { subject.deduct(2) }.to change { subject.balance }.from(4).to(2)
    end    

    it 'checks if you are in journey' do
      expect(subject.in_journey?).to eq(false)
    end
    
    it 'checks if you have touched in' do 
      subject.top_up(5)
      subject.touch_in
      expect(subject.state).to eq(true)
    end  
    
    it 'checks if you have touched out' do
      subject.touch_out
      expect(subject.state).to eq(false)
    end

    it 'checks the state of the journey' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    it "checks for min amount of £1 when touch_in" do
      expect {subject.touch_in}.to raise_error("insufficient balance")
    end
end



