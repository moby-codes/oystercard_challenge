require 'journey'
require 'station'

describe Journey do
  # setting a double with a stub to use top_up's value
  let (:oystercard) { double(:card, {top_up: 50} ) }
  #setting a double for station
  let (:station1) { double (Station.new("LB", 1))}
  let (:station2) { double (Station.new("KG", 2))}
  let (:subject)  {Journey.new(station1)}
   
  it 'checks if you are in journey' do
    expect(subject.complete?).to eq(false)
  end

  it 'checks if the journey is completed' do
   subject.end_journey(station1)
    expect(subject.complete?).to eq(true) 
  end

  it 'stores the entry station' do
    expect(subject.entry_station).to eq station1
  end

  end