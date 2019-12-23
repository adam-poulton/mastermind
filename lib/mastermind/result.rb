module Mastermind
  class Result
    attr_reader :value
    CORRECT_POSITION = "*"
    CORRECT_COLOR = "-"

    def initialize(guess, answer)
      @value = compute_result(guess, answer)
    end

    def correct?
      @value == CORRECT_POSITION * 4
    end

    private

    def compute_result(guess, answer)
      checked = []
      result = ""
      answer.each_with_index { |pin, index|
        # check for correct positions only to avoid 'double scoring'
        if pin.value == guess[index].value
          result << CORRECT_POSITION
          checked << index
        end        
      }
      guess.each_with_index { |pin, index|
        # check for correct colors that are not in the correct place
        if !checked.include?(index) && answer.map(&:value).include?(pin.value)
          result << CORRECT_COLOR
          checked << index
        end
      }
      result
    end

  end
end