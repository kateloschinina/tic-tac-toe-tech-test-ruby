class Game
  attr_reader :player_X, :player_O, :turn, :claim_log, :status

  DEFAULT_STATUS = "Game is on"
  WON_STATUS = " won the game"
  DRAW_STATUS = "It's a draw!"
  BUSY_STATUS = "You can't claim this cell, it is busy"

  ERROR_MESSAGE = "Something went wrong"

  def initialize(player_one_name, player_two_name)
    @player_X = Player.new(player_one_name)
    @player_O = Player.new(player_two_name)
    @turn = @player_X
    @claim_log = ClaimLog.new
    @status = DEFAULT_STATUS
  end

  def new_claim(column, row)
    @status = @claim_log.add(@turn, column, row)
    case @status
    when ClaimLog::BUSY
      @status = BUSY_STATUS
    when ClaimLog::CONTINUE
      change_turn
      @status = DEFAULT_STATUS
    when ClaimLog::WON
      @status = @turn.name + WON_STATUS
    when ClaimLog::DRAW
      @status = DRAW_STATUS
    else
      raise ERROR_MESSAGE
    end
  end

  private

  def change_turn
    @turn = @turn == @player_X ? @player_O : @player_X
  end
end
