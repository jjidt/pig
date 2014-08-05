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

player_name = prompt("Player, please enter your name")

new_game = Game.new(player_name)

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
  choice = prompt("Hello #{current_player.name}\n Press Enter To Roll")
  dice_value = new_game.take_turn
  current_player.add_to_score(dice_value.inject(:+))
  puts "You have rolled a #{dice_value[0]} and a #{dice_value[1]}"
  prompt("Press Enter For Next Turn")
end
