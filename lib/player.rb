# This class controls player actions
class Player
  attr_reader :name, :past_guesses

  def initialize(player_name)
    @name = player_name
    @past_guesses = []
  end

  def ask_for_guess
    loop do
      guess = gets.chomp.downcase
      if guess.length == 1 && guess.match?(/[a-z]/) && !@past_guesses.include?(guess)
        @past_guesses << guess
        return guess
      elsif guess == "save"
        return "save"
      end
      puts "Invalid guess. Try again."
    end
  end
end
