require_relative 'station'

class Oystercard 
  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    # @entry_station = nil
  end

  def top_up(amount)
    raise "Balance exceeds #{MAXIMUM_BALANCE}" if exceeds_max?(amount)

    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "Insufficient funds" if has_min_balance?
    
    record_journey(station)
  end

  def touch_out
    @entry_station = nil
    deduct(MIN_FARE)
  end
  
  private

  def record_journey(station)
    @entry_station = station
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
