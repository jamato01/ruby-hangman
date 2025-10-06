# This class controls player actions
class Player
  attr_reader :name

  def initialize(player_name)
    @name = player_name
    @past_guesses = []
  end

  def ask_for_guess
    this_guess = ""
    loop do
      this_guess = gets.chomp.downcase
      puts "Invalid guess. Try again." if this_guess.length != 1 || !this_guess.match?(/[a-z]/)
      puts "You already guessed this. Try again." if @past_guesses.include?(this_guess)
    end
    this_guess
  end
end
