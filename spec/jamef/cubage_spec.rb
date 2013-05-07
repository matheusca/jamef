require 'spec_helper'

items = [
  Jamef::Item.new(10, 9, 8, 7, 6, 10.0),
  Jamef::Item.new(8, 7, 6, 5, 4, 10.0),
]

describe Jamef::Cubage do
  before(:each) do
    @cubage = Jamef::Cubage.new(items)
  end

  it "should return the cubage" do
     @cubage.total.should == 6720
  end

  it "should human readable" do
    @cubage.to_s.should == '6720,00'
  end

  it "should total price" do
    @cubage.price.total.should == 20.0
  end

  it "should total weight" do
    @cubage.weight.total.should == 10.0
  end
end
