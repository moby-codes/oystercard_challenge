require 'OysterCard'

describe OysterCard do

  let (:station) { double :station}
  let (:journey) { {entry: station, exit: station } }

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

    it 'checks if you are in journey' do
      expect(subject.in_journey?).to eq(false) 
    end
    
    it 'checks if you have touched in' do 
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end  
    
    it 'checks if you have touched out' do
      subject.touch_out(station)
      expect(subject.in_journey?).to eq(false)
    end

    it 'checks the state of the journey' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end
    it "checks for min amount of £1 when touch_in" do
      expect {subject.touch_in(station)}.to raise_error("insufficient balance")
    end
    it "deducts money on touch_out" do
      subject.top_up(5)
      subject.touch_in(station)
      expect{subject.touch_out(station)}.to change{subject.balance}.by -1
    end

    it 'stores the entry station' do
      subject.top_up(5)
      subject.touch_in(station) 
      expect(subject.entry_station).to eq station
    end

    it 'initializes with an empty journey array' do
      expect(subject.journey).to eq([])
    end 

    it 'checks if the journey history is saved' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.journey).to include(journey)
    end
end

