module Jamef
  class Item
    include ActiveModel::Validations

    validate :width, :height, :length, :quantity, :weight, :price, presence: true

    attr_accessor :width, :height, :length, :quantity, :weight, :price
    
    def initialize(width=nil, height=nil, length=nil, quantity=nil, weight=nil, price=nil)
      @width = width
      @height = height
      @length = length
      @quantity = quantity
      @weight = weight
      @price = price
    end

    def cubage
      Elegible.new('*', self.width, self.height, self.length, self.quantity).total
    end

  end
end
