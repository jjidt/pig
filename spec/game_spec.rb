require 'spec_helper'

describe 'Game' do
  it 'creates a new game' do
    test_game = Game.new("steve", "bob")
    expect(test_game).to be_an_instance_of Game
  end

  it 'initializes with two players, one with a name, and one called the computer' do
    test_game = Game.new("steve", "bob")
    expect(test_game.players[0].name).to eq "steve"
  end

  it 'sets a turn that starts with the human player' do
    test_game = Game.new("bob", "bob")
    expect(test_game.turn).to eq 0
  end

  describe 'take_turn' do
    it 'has the current player take a turn rolling the dice and returns the dice values' do
      test_game = Game.new("bob", "rick")
      expect(test_game.take_turn).to be_an_instance_of Array
    end
  end
end
