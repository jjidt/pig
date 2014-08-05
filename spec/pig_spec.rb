require 'rspec'
require 'dice'

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
