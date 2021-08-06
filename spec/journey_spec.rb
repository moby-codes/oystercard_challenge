require 'journey'
require 'station'

describe Journey do
  # setting a double with a stub to use top_up's value
  let (:oystercard) { double(:card, {top_up: 50} ) }
  #setting a double for station
  let (:station1) { double (Station.new("LB", 1))}
  let (:station2) { double (Station.new("KG", 2))}
  let (:subject)  {Journey.new(station1)}

  describe "#initialize method" do
    it 'stores the entry station' do
      expect(subject.entry_station).to eq station1
    end

    it "sets exit station to nil" do
      expect(subject.exit_station).to eq(nil)
    end
  end

  describe "#end_journey method" do
    it "sets exit station to argument" do
      subject.end_journey(station1)
      expect(subject.exit_station).to eq(station1)
    end
    
    it "returns a hash with journey details" do
      expect(subject.end_journey(station2)).to eq({ :entry => station1, :exit => station2 })
    end
  end

  describe "#fare method" do
    it "should return min_fare if journey complete" do
      subject.end_journey(station2)
      expect(subject.fare).to eq(Journey::MIN_FARE)
    end

    it "should return penalty_fare if journey incomplete" do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end

  describe "#complete? method" do
    it 'checks if you are in journey' do
      expect(subject.complete?).to eq(false)
    end
  
    it 'checks if the journey is completed' do
     subject.end_journey(station1)
      expect(subject.complete?).to eq(true) 
    end
  end
end