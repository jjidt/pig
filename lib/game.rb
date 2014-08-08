class Game

  attr_accessor :players, :turn

  def initialize(player1_name = "anonymous", player2_name = "anonymous")
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @turn = 0
  end

  def take_turn
    current_dice = @players[@turn].roll_dice.map {|die| die.number}
    current_dice
  end

end
