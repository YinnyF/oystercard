require_relative 'station'

class Oystercard 
  attr_reader :balance, :list_of_journeys
  MAXIMUM_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "Balance exceeds #{MAXIMUM_BALANCE}" if exceeds_max?(amount)
    @balance += amount
  end

  def in_journey?
    return false if @list_of_journeys.empty?
    has_entry_station unless has_exit_station 
  end

  def touch_in(station)
    raise "Insufficient funds" if has_min_balance?
    record_journey(station)
  end

  def touch_out(station)
    deduct(MIN_FARE)
    end_journey(station)
  end
  
  private

  def has_exit_station
    !!@list_of_journeys[-1][:exit_station]
  end

  def has_entry_station
    !!@list_of_journeys[-1][:entry_station]
  end

  def end_journey(station)
    @list_of_journeys[-1][:exit_station] = station
  end

  def record_journey(station)
    @list_of_journeys.push({ :entry_station => station })
  end

  def has_min_balance?
    @balance < MIN_FARE
  end  

  def exceeds_max?(amount)
    amount + @balance > MAXIMUM_BALANCE
  end 

  def enough_funds?(amount)
    amount > @balance
  end

  def deduct(amount)
    raise "Insufficient funds" if enough_funds?(amount)
    
    @balance -= amount
  end
  
end
