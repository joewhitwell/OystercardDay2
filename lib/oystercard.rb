class Oystercard
attr_reader :in_use
attr_accessor :balance
DEFAULT_AMOUNT = 0

MAX_BALANCE = 90

  def initialize(balance = DEFAULT_AMOUNT)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise "Balance £#{@balance + amount}, Limit exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

def touch_out
  @in_use = false
end

def in_journey?
  @in_use
end

end
