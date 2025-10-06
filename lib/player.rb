# This class controls player actions
class Player
  attr_reader :name, :past_guesses

  def initialize(player_name)
    @name = player_name
    @past_guesses = []
  end

  def ask_for_guess
    this_guess = ""
    loop do
      this_guess = gets.chomp.downcase
      if this_guess.length != 1 || !this_guess.match?(/[a-z]/)
        puts "Invalid guess. Try again."
      elsif @past_guesses.include?(this_guess)
        puts "You already guessed this. Try again."
      else
        break
      end
    end
    this_guess
  end
end
