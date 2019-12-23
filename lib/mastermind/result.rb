module Mastermind
  class Result
    attr_reader :value
    CORRECT_POSITION = "*"
    CORRECT_COLOR = "-"

    def initialize(guess, answer)
      @value = compare(guess, answer)
    end

    def correct?
      @value == CORRECT_POSITION * 4
    end

    private

    def compute_result(guess, answer)
      checked_answer = []
      checked_guess = []
      result = ""
      answer.each_with_index { |pin, index|
        # check for correct positions only to avoid 'double scoring'
        if pin.value == guess[index].value
          result << CORRECT_POSITION
          checked_answer << index
        end        
      }
      answer.each_with_index { |pin, index|
        # check for correct colors that are not in the correct place
        next if checked_answer.include?(index)
        match_index = guess.map(&:value).index(pin.value)
        
        if guess.map(&:value).include?(pin.value)
          result << CORRECT_COLOR
          checked_guess << guess.map(&:value).find(pin.value)
        end
      }
      result
    end

    def compare(guess, answer)
      result = []
      attempt = guess.map(&:value)
      target = answer.map(&:value)
      index = 0
      finish = target.length-1
      # check for perfect matches at each index
      while index <= finish
        if attempt[index] == target[index]
          result << CORRECT_POSITION
          attempt.delete_at(index)
          target.delete_at(index)
          finish -= 1
        else
          index += 1
        end
      end
      (0...target.size).each { |i| 
        if target.include?(attempt[i])
          result << CORRECT_COLOR
          target.delete_at(target.index(attempt[i]))
        end
      }
      return result.join
    end

  end
end