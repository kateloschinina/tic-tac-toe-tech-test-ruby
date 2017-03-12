class Player

  attr_reader :name

  DEFAULT_NAME = "Anonimus"

  def initialize(name = DEFAULT_NAME)
    @name = name.empty? ? DEFAULT_NAME : name
  end
end
