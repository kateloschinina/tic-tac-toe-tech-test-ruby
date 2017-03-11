class ClaimLog
  attr_reader :log

  def initialize
    @log = []
  end

  def add(claim)
    @log << claim
  end
end
