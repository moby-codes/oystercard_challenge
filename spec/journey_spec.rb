require 'journey'

describe Journey do
  # setting a double with a stub to use top_up's value
  let (:oystercard) { double(:card, {top_up: 50} ) }
  #setting a double for station
  let (:station) { double :station}

  it { is_expected.to respond_to :journeys}
  
  it 'checks if you have touched in' do 
    p oystercard
    p oystercard.top_up
    subject.touch_in(station)
    expect(subject.in_journey?).to eq(true)
  end  

end