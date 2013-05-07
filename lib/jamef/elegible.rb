module Jamef
  class Elegible
    include ActionView::Helpers::NumberHelper
    attr_reader :total

    def initialize(operator, *args)
      args = args.shift if args[0].kind_of?(Array)
      @total = args.inject(operator)
    end

    def to_s
      number_to_currency(@total, separator: ",", delimiter: "", format: "%n")
    end

  end
end
