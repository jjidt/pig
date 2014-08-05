class Player

  attr_reader :name, :score

  def initialize(name = nil)
    @name = name
    @score = 0
  end

  def add_to_score(number)
    @score += number
  end

end
