class Game

  attr_reader :players, :turn

  def initialize(player_name = "anonymous")
    @players = [Player.new(player_name), Player.new("The Computer")]
    @turn = 0
  end

end
