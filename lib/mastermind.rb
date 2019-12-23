#require "mastermind/version"

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./mastermind/pin.rb"
require_relative "./mastermind/result.rb"
require_relative "./mastermind/board.rb"
require_relative "./mastermind/game.rb"