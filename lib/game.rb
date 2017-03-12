class Game
  attr_reader :player_X, :player_O, :turn, :claim_log, :status

  DEFAULT_STATUS = "Game is on"
  WON_STATUS = " won the game"

  ERROR_MESSAGE = "Something went wrong"

  def initialize(player_one, player_two)
    @player_X = player_one
    @player_O = player_two
    @turn = @player_X
    @claim_log = ClaimLog.new
  end

  def new_claim(column, row)
    @status = @claim_log.add(@turn, column, row)
    case @status
    when ClaimLog::BUSY
      @status
    when ClaimLog::CONTINUE
      change_turn
      @status
    when ClaimLog::WON
      @turn.name+WON_STATUS
    else
      raise ERROR_MESSAGE
    end
  end

  private

  def change_turn
    @turn = @turn == @player_X ? @player_O : @player_X
  end
end
