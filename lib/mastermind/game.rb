module Mastermind
  class Game
    attr_reader :board

    def initialize()
      @board = Board.new()
    end

    def play
      puts "\e[H\e[2J"
      puts "Welcome to Mastermind"
      puts
      puts "Feedback: * correct placement, - correct colour "
      puts
      puts "Round #{1} of #{board.max_round}"
      while board.current_round < board.max_round
        board.current_round += 1
        board.add_guess(get_input)
        puts "\e[H\e[2J"
        puts "Round #{board.current_round} of #{board.max_round}"
        board.formatted
        if !board.results.last.nil? && board.results.last.correct?
          puts "Winner!!"
          return
        end
      end
      puts "You lose... Answer was: #{board.get_answer}"
    end

    private

    def options
      "Select 4: (R)ed, (B)lue, (G)reen, (Y)ellow, (P)urple, (C)yan"
    end

    def get_input
      valid = false
      while !valid
        puts options
        input = gets.chomp.upcase.gsub(/\s/, "")
        reg = /^[RGBYPC]{4}/ =~ input
        valid = !reg.nil?
        if !valid
          puts "ERROR: combination must be of the form 'BBBB'"
        end
      end
      input
    end
  end
end