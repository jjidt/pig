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
  PPPPPPPPPP          IIIIIIIIII      GGGGGG   GGGG\n\n
****************************************************************************************************
**Win by being the first player with 100 or more points, roll a 1 and get no points for that round**
****************************************************************************************************
\n\n"



player1_name = prompt("Player 1, please enter your name>  ")
player2_name = prompt("player 2, please enter your name>  ")

temp_score = 0
new_game = Game.new(player1_name, player2_name)

loop do
  system("clear")
  puts "

  PPPPPPPPPPPPPPPPP   IIIIIIIIII      GGGGGGGGGGGGG
  P::::::::::::::::P  I::::::::I   GGG::::::::::::G      #{player1_name}: #{new_game.players[0].score}
  P::::::PPPPPP:::::P I::::::::I GG:::::::::::::::G      #{player2_name}: #{new_game.players[1].score}
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
  prompt("Hello #{current_player.name}\n Press Enter To Roll")
  dice_values = new_game.take_turn
  if !current_player.rolled_pig?
    temp_score += (dice_values.inject(:+))
    puts "You have rolled a #{dice_values[0]} and a #{dice_values[1]}\n"
    puts "Your round score is currently #{temp_score}\n"
    loop do
      break if current_player.score + temp_score >= 100
      player_choice = prompt("enter 'r' to roll again, or 'p' to pass to the other player")
      case player_choice
        when 'r'
          puts "You have chosen to roll again"
          break
        when 'p'
          current_player.add_to_score(temp_score)
          new_game.turn ^= 1
          temp_score = 0
          break
      end
    end

  else
    puts "You have rolled a #{dice_values[0]} and a #{dice_values[1]}"
    puts "You rolled PIG! Your score stays at #{current_player.score}, next players turn"
    new_game.turn ^= 1
    prompt("Press Enter To Advance")
    temp_score = 0
  end
  if current_player.has_won? || current_player.score + temp_score >= 100
    current_player.add_to_score(temp_score)
    puts "#{current_player.name} has Won!"
    break
  end
end
