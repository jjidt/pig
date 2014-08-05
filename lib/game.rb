class Game

  attr_reader :players, :turn

  def initialize(player_name = "anonymous")
    @players = [Player.new(player_name), Player.new("The Computer")]
    @turn = 0
  end

  def take_turn
    current_dice = @players[@turn].roll_dice.map {|die| die.number}
    @turn ^= 1
    current_dice
  end

end
