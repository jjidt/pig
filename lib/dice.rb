class Dice

  attr_accessor :number

  def initialize
    @number = Random.rand(1..6)
  end

end
