require_relative 'OysterCard'

class Journey

  #attr_reader :entry_station, :journeys

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def end_journey(station)
    save_journey(@entry_station, station)
    @entry_station = nil  
    deduct(MIN_FARE)
  end  
  
  def fare 
  
  end



end