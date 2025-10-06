# This class runs the came
class Game
  def initialize(player_name)
    @player = Player.new(player_name)
    @remaining_guesses = 6
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
    @guess_board = Array.new(@secret_word.length, "_ ")
  end

  def player_turn
    system("clear")
    puts "#{@remaining_guesses} incorrect guesses left.\n"
    puts @guess_board.join
    puts "\nAlright #{@player.name}, guess a letter."
    player_guess = @player.ask_for_guess
    check_guess
    if check_win
      win_screen
    elsif check_lose
      lose_screen
    else
      player_turn
    end
  end
end
