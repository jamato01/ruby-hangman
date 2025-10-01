require_relative "lib/game"
require_relative "lib/player"

system("clear")
puts "Welcome to Hangman! What is your name?"
player_name = gets.chomp

Game.new(player_name).start_game
