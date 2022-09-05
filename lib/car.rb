class Car
  attr_reader :name, :monthly_payment, :loan_length, :color
  
  def initialize(name, monthly_payment, loan_length)
    @name = name
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = color
  end
  
  def make
    @name.split.first
  end
  
  def model
    @name.split.last
  end
  
  def total_cost
    @monthly_payment * @loan_length
  end
  
  def paint!(color)
    @color = color
  end
end