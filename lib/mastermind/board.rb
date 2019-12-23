module Mastermind
  class Board
    attr_reader :grid, :max_round, :answer, :results
    attr_accessor :current_round

    MAX_ROUNDS = 12

    def initialize(input = {})
      @grid = []
      @max_round = input.fetch(:rounds, MAX_ROUNDS)
      @results = []
      @current_round = 0
      set_answer(input.fetch(:answer, random_answer))
    end

    def add_guess(input)
      guess = to_pins(input)
      @grid << guess
      @results << Result.new(guess, answer)
    end

    def set_answer(input)
      @answer = to_pins(input)
    end

    def get_answer
      to_str(answer)
    end

    def formatted
      grid.each_with_index { |row, index| 
        puts row.map{ |pin| colorize(pin.value) }.join(" ") + " " + results[index].value
      }
    end

    private 

    def random_answer
      options = %w(R G B Y P C)
      answer = ""
      4.times {
        answer << options.sample
      }
      answer
    end

    def default_grid
      []
    end

    def to_pins(input)
      pins = []
      input.split("").each { |char|
        pins << Pin.new(char)
      }
      pins
    end

    def to_str(pins)
      pins.map(&:value).join
    end

    def colorize(letter)
      case letter
      when "R"
        color(31, letter)
      when "G"
        color(32, letter)
      when "Y"
        color(33, letter)
      when "B"
        color(34, letter)
      when "P"
        color(35, letter)
      when "C"
        color(36, letter)
      else
        letter
      end
    end

    def color(code, input)
      "\e[#{code}m#{input}\e[0m"
    end

  end
end