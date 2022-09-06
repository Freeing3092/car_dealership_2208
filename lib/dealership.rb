class Dealership
  attr_reader :name, :address, :inventory, :inventory_makes
  
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
    @inventory_makes = inventory_makes
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
  
  def average_price_of_car
    (total_value / inventory_count).to_s.insert(-4, ',')
  end
  
  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.total_cost
    end
  end
  
  def inventory_hash
    
  end
  
  def inventory_all_makes
    @inventory_makes = []
    @inventory.each do |car|
      inventory_makes << car.make
    end
  end
  
  def inventory_unique_makes
    @inventory_makes.uniq
  end
end