require_relative 'oystercard'

class Journey

attr_reader :entry_station, :exit_station, :fare
attr_accessor :current_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @current_journey = {entry_station: nil, exit_station: nil}
    @fare = Oystercard::MIN_FARE
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
  end

  def finish_journey(exit_station)
    # fail "Currently not travelling" if @entry_station == nil
    @exit_station = exit_station
    @current_journey[:exit_station] = exit_station
  end

  # def in_journey?
  #   !!@entry_station  # converts @entry_station in a boolean (will return true for any value thats not nil/false)
  #   # if @entry_station != nil
  #   #   return true
  #   # else false
  #   # end
  # end

  def fare
    if @current_journey[:entry_station] == nil && @current_journey[:exit_station] != nil
      @fare = Oystercard::PENALTY_FARE
    elsif @current_journey[:entry_station] != nil && @current_journey[:exit_station] == nil
      @fare = Oystercard::PENALTY_FARE
    else @fare
    end
  end

  def reset_journey
    @fare = Oystercard::MIN_FARE
    @entry_station = nil
    @exit_station = nil
    @current_journey = {entry_station: nil, exit_station: nil}
  end
end
