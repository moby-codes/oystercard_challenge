require 'OysterCard'
require "station"
require "journey"

describe OysterCard do

  # let (:journey) { {entry: station, exit: station } }
  let (:station1) { double (Station.new("LB", 1))}
  let (:station2) { double (Station.new("KG", 2))}
  before { subject.top_up(50) }
 
  describe "#initialize method" do
    it 'should start with a balance of 0' do
      expect(OysterCard.new.balance).to eq(0)
    end
    
    it 'should start with an empty journey_log' do
      expect(subject.journey_log).to eq([])
    end

    it 'should start journey as nil' do
      expect(subject.journey).to eq(nil)
    end
  end 

  describe "#top_up method" do
    it 'should add to the balance' do
      expect { subject.top_up(5) }.to change { subject.balance }.by(5)
    end

    it 'Raises an error when topup exceeds maximum value' do
      message = "Cannot exceed maximum amount #{OysterCard::MAX_BALANCE}"
      expect { subject.top_up(OysterCard::MAX_BALANCE) }.to raise_error message
   end
  end

  describe "#touch_in method" do
    it "should charge penalty if previous journey incomplete" do
      subject.touch_in(station1)
      expect { subject.touch_in(station1) }.to change { subject.balance }.by(-Journey::PENALTY_FARE)
    end

    it "should raise error if you don't have enough balance" do
      expect { OysterCard.new.touch_in(station1) }.to raise_error "insufficient balance"
    end
    
    it "should change journey to a new journey instance" do
      subject.touch_in(station1)
      expect(subject.journey).not_to eq(nil)
    end
  end

  describe "#touch_out method" do

  end
end




 

   


#     it 'checks if you are in journey' do
#       expect(subject.in_journey?).to eq(false) 
#     end
    
#     it 'checks if you have touched in' do 
#       subject.top_up(5)
#       subject.touch_in(station)
#       expect(subject.in_journey?).to eq(true)
#     end  
    
#     it 'checks if you have touched out' do
#       subject.touch_out(station)
#       expect(subject.in_journey?).to eq(false)
#     end

#     it 'checks the state of the journey' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       subject.touch_out(station)
#       expect(subject).not_to be_in_journey
#     end
#     it "checks for min amount of £1 when touch_in" do
#       expect {subject.touch_in(station)}.to raise_error("insufficient balance")
#     end
#     it "deducts money on touch_out" do
#       subject.top_up(5)
#       subject.touch_in(station)
#       expect{subject.touch_out(station)}.to change{subject.balance}.by -1
#     end

#     it 'stores the entry station' do
#       subject.top_up(5)
#       subject.touch_in(station) 
#       expect(subject.entry_station).to eq station
#     end

#     it 'initializes with an empty journey array' do
#       expect(subject.journey).to eq([])
#     end 

#     it 'checks if the journey history is saved' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       subject.touch_out(station)
#       expect(subject.journey).to include(journey)
#     end
# end

