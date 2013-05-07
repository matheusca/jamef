require 'spec_helper'
require 'fakeweb'

items = [
  Jamef::Item.new(10, 9, 8, 7, 6, 10.0),
  Jamef::Item.new(8, 7, 6, 5, 4, 10.0),
]

describe Jamef::Tax do
  subject{Jamef::Tax}

  context "success" do
    before(:each) do
      page = File.open(File.join(File.dirname(__FILE__), '..', 'response', 'carrier_success.xml')).read
      @cubage ||= Jamef::Cubage.new(items)

      FakeWeb.register_uri(:get, %r|www\.jamef\.com\.br|, :body => page, content_type: 'text/xml')
      FakeWeb.allow_net_connect = false
    end

    it "should return the tax" do
      tax = subject.new
      tax.cubage = @cubage
      tax.cnpj = "1234"
      tax.region = Jamef::RAO
      tax.cep = "140000100"
      tax.uf = "SP"

      tax.get.should == 40.0
    end
  end

  context "fail" do
    describe "no pass arg cubage" do

      it "should raise" do
        tax = subject.new

        expect{tax.get}.to raise_error
      end
      
    end

    describe "code 2" do
      before(:each) do
        page = File.open(File.join(File.dirname(__FILE__), '..', 'response', 'carrier_error.xml')).read
        @cubage ||= Jamef::Cubage.new(items)

        FakeWeb.register_uri(:get, %r|www\.jamef\.com\.br|, :body => page, content_type: 'text/xml')
        FakeWeb.allow_net_connect = false
      end

      it "should raise when show code two in status" do
        tax = subject.new
        tax.cubage = @cubage
        tax.cnpj = "1234"
        tax.region = Jamef::RAO
        tax.cep = "140000100"
        tax.uf = "SP"
 
        expect{tax.get}.to raise_error
      end

    end
  end

end
