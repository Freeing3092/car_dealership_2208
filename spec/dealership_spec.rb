require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  it "is a member of its class" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    
    expect(dealership).to be_a Dealership
  end
  
  it "has a name" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    
    expect(dealership.name).to eq("Acme Auto")
  end
  
  it "has an address" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    
    expect(dealership.address).to eq("123 Main Street")
  end
  
  it "has an inventory that is empty by default" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    
    expect(dealership.inventory).to eq([])
  end
  
  it "#inventory_count will return the number of cars in inventory" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    expect(dealership.inventory_count).to eq(0)
  end
  
  it "#add_car will add cars to the inventory" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    expect(dealership.inventory).to eq([car_1, car_2])
    expect(dealership.inventory_count).to eq(2)
  end
  
  it "#has_inventory? will return boolean value" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    
    expect(dealership.has_inventory?).to eq(false)
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    
    expect(dealership.has_inventory?).to eq(true)
  end
  
  it "#cars_by_make will return car objects matching 
  the make passes as an argument" do
  dealership = Dealership.new("Acme Auto", "123 Main Street")
  car_1 = Car.new("Ford Mustang", 1500, 36)
  car_2 = Car.new("Toyota Prius", 1000, 48)
  car_3 = Car.new("Toyota Tercel", 500, 48)
  car_4 = Car.new("Chevrolet Bronco", 1250, 24)
  
  dealership.add_car(car_1)
  dealership.add_car(car_2)
  dealership.add_car(car_3)
  dealership.add_car(car_4)
  
  expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
  expect(dealership.cars_by_make("Ford")).to eq([car_1])
  end
  
  it "#total_value return the total value of inventory" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    
    expect(dealership.total_value).to eq(156000)
  end
  
  it "#details will display hash of total value and address" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    
    expect(dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
  end
  it "#average_price_of_car return the average cost of inventory" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.average_price_of_car).to eq("39,000")
  end
  
  it "#cars_sorted_by_price return the inventory from lowest cost to highest" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36) #54,000
    car_2 = Car.new("Toyota Prius", 1000, 48) #48,000
    car_3 = Car.new("Toyota Tercel", 500, 48) #24,000
    car_4 = Car.new("Chevrolet Bronco", 1250, 24) #30,000
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    
    expect(dealership.cars_sorted_by_price).to eq([car_3, car_4, car_2, car_1])
  end
  
  it "#inventory_hash returns a hash of cars from lowest cost to highest" do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36) #54,000
    car_2 = Car.new("Toyota Prius", 1000, 48) #48,000
    car_3 = Car.new("Toyota Tercel", 500, 48) #24,000
    car_4 = Car.new("Chevrolet Bronco", 1250, 24) #30,000
    
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    require "pry"; binding.pry
    expect(dealership.inventory_hash).to eq()
  end
  
end
















