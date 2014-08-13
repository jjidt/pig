require 'spec_helper'

describe 'Player' do
  it 'creates a new player' do
    test_player = Player.new("bob")
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

  describe 'rolled_pig?' do
    it 'checks if one of the dice has a value of 1' do
      test_player = Player.new("carl")
      test_player.roll_dice
      test_player.dice[0].number = 1
      expect(test_player.rolled_pig?).to eq true
    end

    it 'checks if neither of the dice has a value of 1' do
      test_player = Player.new("carl")
      test_player.roll_dice
      test_player.dice[0].number = 2
      test_player.dice[1].number = 3
      expect(test_player.rolled_pig?).to eq false
    end
  end
end
