class Dice

  attr_reader :number

  def initialize
    @number = Random.rand(1..6)
  end

end
