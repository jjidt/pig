class Player

  attr_accessor :score
  attr_reader :name

  def initialize(name = nil)
    @name = name
    @score = 0
  end

end
