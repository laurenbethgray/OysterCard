require 'oystercard'

class Journey < Oystercard

  def initialize
    @journeys = []
  end

  def in_journey?
    @entry_station
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    # @journeys << { :entry => entry_station, :exit => exit_station }
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    # @journeys[-1][:exit] = exit_station
    @journeys << { entry_station => exit_station }
    @entry_station = nil
  end
end
