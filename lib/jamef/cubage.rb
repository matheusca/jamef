module Jamef
  class Cubage
    
    attr_accessor :items

    def initialize(items)
      @items = items.kind_of?(Array) ? items : [items]
    end

    def total
      Elegible.new('+', cubage_sum).total 
    end

    def to_s
      Elegible.new('+', cubage_sum).to_s
    end

    def price
      Elegible.new('+', price_sum)
    end

    def weight
      Elegible.new('+', weight_sum)
    end

    private

    def cubage_sum
      array_sum(:cubage)
    end

    def price_sum
      array_sum(:price)
    end

    def weight_sum
      array_sum(:weight)
    end

    def array_sum(variable)
      sum = []
      self.items.each{|item| sum << item.send(variable)}

      sum
    end

  end
end
