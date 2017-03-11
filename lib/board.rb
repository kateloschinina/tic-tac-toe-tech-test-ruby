class Board
  attr_reader :player_X, :player_O, :turn, :last_claim

  def initialize(player_one, player_two)
    @player_X = player_one
    @player_O = player_two
    @turn = @player_X
    @claim_log = ClaimLog.new
  end

  def new_claim(column, row)
    @turn = @turn == @player_X ? @player_O : @player_X
    @last_claim = Claim.new(column, row)
    @claim_log.add @last_claim
  end
end
