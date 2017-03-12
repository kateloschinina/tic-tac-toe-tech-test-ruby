class ClaimLog
  attr_accessor :log

  WON = "won"
  BUSY = "busy"
  CONTINUE = "continue"
  DRAW = "continue"

  def initialize
    @log = Array.new(9)
  end

  def add(player, column, row)
    free?(column, row) ? add_claim(player, column, row) : BUSY
  end

  def won?
    false
  end

  def draw?
    @log.each { |x| return CONTINUE if x == nil}
    DRAW
  end

  private

  def add_claim(player, column, row)
    @log[position(column, row)] = player
    self.won? ? WON : self.draw?
  end

  def free?(column, row)
    @log[position(column, row)] ? false : true
  end

  def position(column, row)
    (row-1)*3 + column - 1
  end
end
