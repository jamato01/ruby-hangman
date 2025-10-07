require_relative "lib/game"
require_relative "lib/player"
require "yaml"

system("clear")
puts "Welcome to Hangman!"
puts "Would you like to load a saved game? (y/n)"
load_choice = gets.chomp.downcase
if load_choice == "y"
  puts "Enter the name of your save file:"
  file_name = gets.chomp
  if File.exist?("lib/saved_games/#{file_name}.yml")
    saved_game = File.read("lib/saved_games/#{file_name}.yml")
    File.delete("lib/saved_games/#{file_name}.yml")
    game = YAML.safe_load(saved_game, permitted_classes: [Game, Player])
    game.player_turn
  else
    puts "Save file not found. Starting a new game."
    puts "Enter your name:"
    player_name = gets.chomp
    Game.new(player_name).start_game
  end
else
  puts "Enter your name:"
  player_name = gets.chomp
  Game.new(player_name).start_game
end
