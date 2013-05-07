require 'spec_helper'

describe Jamef::Elegible do
  context "small numbers" do
    subject{Jamef::Elegible.new('+',1,2,3,4)}
    
    it "should return sum of args" do
      subject.total.should eq(10)
    end

    it "should jamef send" do
      subject.to_s.should == "10,00" 
    end
  end

  context "big numbers" do
    subject{Jamef::Elegible.new('*', 1000, 1000.10)}

    it "should return multiplier of args" do
      subject.to_s.should == "1000100,00"
    end
  end

  context 'pass array arg' do
    subject{Jamef::Elegible.new('*', [100, 100])}
    
    it "should return multiplier array" do
      subject.total.should eql(10000)
      subject.to_s.should == "10000,00"
    end
  end

end
