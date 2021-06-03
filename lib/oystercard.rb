class Oystercard 
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance exceeds #{MAXIMUM_BALANCE}" if exceeds_max?(amount)

    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds" if has_min_balance?

    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end
  
  private

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