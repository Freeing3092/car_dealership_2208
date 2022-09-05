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
    require "pry"; binding.pry
    expect(dealership.inventory).to eq([car_1, car_2])
    expect(dealership.inventory_count).to eq(2)
  end
end