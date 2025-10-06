# This class runs the came
class Game
  def initialize(player_name)
    @player = Player.new(player_name)
  end

  def start_game
    @secret_word = create_word
    puts @secret_word
  end

  def create_word
    f = File.open("lib/google-10000-english-no-swears.txt")
    word_list = []
    while (word = f.gets)
      word_list.push(word) if word.length.between?(5, 12)
    end
    word_list.sample
  end
end
