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
    row_won? or column_won? or diagnal_won?
  end

  def draw?
    @log.each { |x| return CONTINUE if x == nil}
    DRAW
  end

  private

  def row_won?
    same_and_not_nil?(@log[0],@log[1],@log[2]) or
    same_and_not_nil?(@log[3],@log[4],@log[5]) or
    same_and_not_nil?(@log[6],@log[7],@log[8])
  end

  def column_won?
    same_and_not_nil?(@log[0],@log[3],@log[6]) or
    same_and_not_nil?(@log[1],@log[4],@log[7]) or
    same_and_not_nil?(@log[2],@log[5],@log[8])
  end

  def diagnal_won?
    same_and_not_nil?(@log[0],@log[4],@log[8]) or
    same_and_not_nil?(@log[2],@log[4],@log[6])
  end

  def same_and_not_nil?(a, b, c)
    [a, b, c].uniq.length == 1 and a!=nil and b!=nil and c!=nil
  end

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
