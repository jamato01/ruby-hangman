# This class runs the came
class Game
  def initialize(player_name)
    @player = Player.new(player_name)
    @remaining_guesses = 6
    @past_guesses = []
  end

  def start_game
    @secret_word = create_word
    create_blank_guess
    player_turn
  end

  def create_word
    f = File.open("lib/google-10000-english-no-swears.txt")
    word_list = []
    while (word = f.gets)
      word_list.push(word) if word.length.between?(5, 12)
    end
    word_list.sample.chars
  end

  def create_blank_guess
    @guess_board = Array.new(@secret_word.length - 1, "_ ")
  end

  def player_turn
    system("clear")
    puts "#{@remaining_guesses} incorrect guesses left.\n"
    puts @guess_board.join
    puts "\nPast guesses: #{@past_guesses}"
    puts "\nAlright #{@player.name}, guess a letter."

    player_guess = @player.ask_for_guess
    @past_guesses.push(player_guess)
    check_guess(player_guess)
    if check_win
      win_screen
    elsif check_lose
      lose_screen
    else
      player_turn
    end
  end

  def check_guess(guess)
    if @secret_word.include?(guess)
      @secret_word.each_with_index do |val, index|
        @guess_board[index] = "#{guess} " if val == guess
      end
    else
      @remaining_guesses -= 1
    end
  end

  def check_win
    !@guess_board.include?("_ ")
  end

  def check_lose
    @remaining_guesses.zero?
  end

  def win_screen
    system("clear")
    puts @guess_board.join
    puts "You won with #{@remaining_guesses} guess(es) left! The secret word was #{@secret_word.join}"
  end

  def lose_screen
    puts "You lose! The secret word was #{@secret_word.join}"
  end
end
