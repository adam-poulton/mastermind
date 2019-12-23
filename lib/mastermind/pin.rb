module Mastermind
  class Pin
    attr_accessor :value

    def initialize(value = "")
      @value = value
    end
  end
end