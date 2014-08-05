require 'rspec'
require 'dice'
require 'player'
require 'game'

describe 'Dice' do
  it 'creates a single instance of dice' do
    test_dice = Dice.new
    expect(test_dice).to be_an_instance_of Dice
  end

  it 'initializes with a random number value between 1 and 6' do
    test_dice = Dice.new
    expect(test_dice.number).to be_an_instance_of Fixnum
  end

end

describe 'Player' do
  it 'creates a new player' do
    test_player = Player.new
    expect(test_player).to be_an_instance_of Player
  end

  it 'initializes a new player with a name' do
    test_player = Player.new("steve")
    expect(test_player.name).to eq "steve"
  end

  it 'initializes with a default score of zero' do
    test_player = Player.new("Ronald")
    expect(test_player.score).to eq 0
  end

  describe 'add_to_score' do
    it 'adds an amount to a players score' do
      test_player = Player.new("rick")
      test_player.add_to_score(8)
      expect(test_player.score).to eq 8
    end
  end

  describe 'has_won?' do
    it 'checks if a player has under a hundred points' do
      test_player = Player.new("carl")
      test_player.add_to_score(99)
      expect(test_player.has_won?).to eq false
    end

    it 'checks if a player has over ninety-nine points' do
      test_player = Player.new("carl")
      test_player.add_to_score(100)
      expect(test_player.has_won?).to eq true
    end
  end

  describe 'roll_dice' do
    it 'creates two new dice' do
      test_player = Player.new("carl")
      test_player.roll_dice
      expect(test_player.dice[0]).to be_an_instance_of Dice
    end
  end
end

describe 'Game' do
  it 'creates a new game' do
    test_game = Game.new
    expect(test_game).to be_an_instance_of Game
  end

  it 'initializes with two players, one with a name, and one called the computer' do
    test_game = Game.new("steve")
    expect(test_game.players[0].name).to eq "steve"
  end

  it 'sets a turn that starts with the human player' do
    test_game = Game.new("bob")
    expect(test_game.turn).to eq 0
  end

  describe 'take_turn' do
    it 'has the current player take a turn rolling the dice and returns the dice values' do
      test_game = Game.new("bob")
      expect(test_game.take_turn).to be_an_instance_of Array
    end

    it 'switches the turn counter to the next player' do
      test_game = Game.new("bob")
      test_game.take_turn
      expect(test_game.turn).to eq 1
    end
  end
end
