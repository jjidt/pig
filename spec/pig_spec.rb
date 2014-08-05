require 'rspec'
require 'dice'

describe 'Dice' do
  it 'creates a single die' do
    test_dice = Dice.new
    expect(test_dice).to be_an_instance_of Dice
  end
end
