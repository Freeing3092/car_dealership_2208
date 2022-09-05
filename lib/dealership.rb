class Dealership
  attr_reader :name, :address, :inventory
  
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end
  
  def inventory_count
    @inventory.count
  end
  
  def add_car(car)
    @inventory << car
  end
  
  def has_inventory?
    if inventory_count == 0
      false
    else
      true
    end
  end
  
  def cars_by_make(make)
    @inventory.find_all {|car| car.make == make}
  end
  
  def total_value
    inventory_cost = @inventory.map do |car|
      car.total_cost
    end
    inventory_cost.sum
  end
  
  def details
    {
      "total_value" => total_value,
      "address" => @address
    }
  end
end