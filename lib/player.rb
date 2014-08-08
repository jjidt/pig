class Player

  attr_reader :name, :dice
  attr_accessor :score

  def initialize(name = nil)
    @name = name
    @score = 0
  end

  def add_to_score(number)
    @score += number
  end

  def has_won?
    @score > 99
  end

  def roll_dice
    @dice = [Dice.new, Dice.new]
  end

  def rolled_pig?
    @dice[0].number == 1 || @dice[1].number == 1
  end
end
