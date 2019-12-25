require_relative "../lib/mastermind.rb"

play_again = true
while play_again
  game = Mastermind::Game.new()
  game.play
  puts
  puts "press 'y' to play again"
  puts
  play_again = gets.chomp.downcase == 'y'
end
