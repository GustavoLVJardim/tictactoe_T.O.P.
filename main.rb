require_relative 'tictactoe.rb'

def main
  game = Game.new
  game.begin_screen
  game.game_board
  game.puts_the_rules
  game.clear_screen
  game.name_players
  game.clear_screen
  game.score
  game.the_game
end

main