# This class runs the came
class Game
  def initialize(player_name)
    @player = Player.new(player_name)
    @solution_word = get_solution
  end
end
