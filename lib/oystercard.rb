class Oystercard 
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance exceeds #{MAXIMUM_BALANCE}" if exceeds_max?(amount)

    @balance += amount
  end
  
private

def exceeds_max?(amount)
  amount + @balance > MAXIMUM_BALANCE
end 
  
end
