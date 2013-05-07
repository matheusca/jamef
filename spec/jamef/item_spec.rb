require 'spec_helper'

describe Jamef::Item do
  subject{Jamef::Item}

  before(:each) do
    @item = subject.new(10, 9, 8, 7, 6, 10.0)
  end

  it "should be valid" do
    @item.should be_valid
  end

  it "should be valid pass arguments" do
    item = subject.new
    item.width = 10
    item.height = 9
    item.length = 8
    item.quantity = 7
    item.weight = 6
    item.price = 10.0
    item.should be_valid
  end

  it "should return self cubage" do
    @item.cubage.should eq(5040)
  end
end
