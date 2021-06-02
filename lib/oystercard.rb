class Oystercard 
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance exceeds #{MAXIMUM_BALANCE}" if exceeds_max?(amount)

    @balance += amount
  end

  def deduct(amount)
    raise "Insufficient funds" if enough_funds?(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
  
  private

  def exceeds_max?(amount)
    amount + @balance > MAXIMUM_BALANCE
  end 

  def enough_funds?(amount)
    amount > @balance
  end
  
end