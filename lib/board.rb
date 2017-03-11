class Board
  attr_reader :player_X, :player_O, :turn

  def initialize(player_one, player_two)
    @player_X = player_one
    @player_O = player_two
    @turn = @player_X
  end
end
