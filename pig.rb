require './lib/dice'
require './lib/player'
require './lib/game'

def prompt(text)
  puts "#{text}:  "
  gets.chomp
end

system("clear")
puts "

PPPPPPPPPPPPPPPPP   IIIIIIIIII      GGGGGGGGGGGGG
P::::::::::::::::P  I::::::::I   GGG::::::::::::G
P::::::PPPPPP:::::P I::::::::I GG:::::::::::::::G
PP:::::P     P:::::PII::::::IIG:::::GGGGGGGG::::G
  P::::P     P:::::P  I::::I G:::::G       GGGGGG
  P::::P     P:::::P  I::::IG:::::G
  P::::PPPPPP:::::P   I::::IG:::::G
  P:::::::::::::PP    I::::IG:::::G    GGGGGGGGGG
  P::::PPPPPPPPP      I::::IG:::::G    G::::::::G
  P::::P              I::::IG:::::G    GGGGG::::G
  P::::P              I::::IG:::::G        G::::G
  P::::P              I::::I G:::::G       G::::G
PP::::::PP          II::::::IIG:::::GGGGGGGG::::G
P::::::::P          I::::::::I GG:::::::::::::::G
P::::::::P          I::::::::I   GGG::::::GGG:::G
PPPPPPPPPP          IIIIIIIIII      GGGGGG   GGGG\n\n"

player1_name = prompt("Player 1, please enter your name\n")
player2_name = prompt("player 2, please enter your name")

new_game = Game.new(player1_name, player2_name)

loop do
  system("clear")
  puts "

  PPPPPPPPPPPPPPPPP   IIIIIIIIII      GGGGGGGGGGGGG
  P::::::::::::::::P  I::::::::I   GGG::::::::::::G      Player: #{new_game.players[0].score}
  P::::::PPPPPP:::::P I::::::::I GG:::::::::::::::G      Computer: #{new_game.players[1].score}
  PP:::::P     P:::::PII::::::IIG:::::GGGGGGGG::::G
    P::::P     P:::::P  I::::I G:::::G       GGGGGG
    P::::P     P:::::P  I::::IG:::::G
    P::::PPPPPP:::::P   I::::IG:::::G
    P:::::::::::::PP    I::::IG:::::G    GGGGGGGGGG
    P::::PPPPPPPPP      I::::IG:::::G    G::::::::G
    P::::P              I::::IG:::::G    GGGGG::::G
    P::::P              I::::IG:::::G        G::::G
    P::::P              I::::I G:::::G       G::::G
  PP::::::PP          II::::::IIG:::::GGGGGGGG::::G
  P::::::::P          I::::::::I GG:::::::::::::::G
  P::::::::P          I::::::::I   GGG::::::GGG:::G
  PPPPPPPPPP          IIIIIIIIII      GGGGGG   GGGG\n\n"

  current_player = new_game.players[new_game.turn]
  if current_player.has_won?
    puts "#{current_player.name} has Won!"
    break
  end
  choice = prompt("Hello #{current_player.name}\n Press Enter To Roll")
  dice_values = new_game.take_turn
  pre_score = current_player.score
  if !current_player.rolled_pig?
    current_player.add_to_score(dice_values.inject(:+))
    puts "You have rolled a #{dice_values[0]} and a #{dice_values[1]}"
    loop do
      player_choice = prompt("enter 'r' to roll again, or 'p' to pass to the other player")
      case player_choice
        when 'r'
          puts "You have chosen to roll again"
          break
        when 'p'
          new_game.turn ^= 1
          break
      end
    end

  else
    puts "You have rolled a #{dice_values[0]} and a #{dice_values[1]}"
    puts "You rolled PIG! Your score drops to #{pre_score}, next players turn"
    current_player.score = pre_score
    new_game.turn ^= 1
    prompt("Press Enter To Advance")
  end
end
