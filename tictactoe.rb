class Game

  @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  def name_players
    @names = take_name_player()
    gets.chomp
    #puts "The name is saved here: #{@names}"
    return @names
  end

 def begin_screen
   puts
   puts "WELCOME TO TIC TAC TOE CLI GAME!"
   puts 
   puts "This game was developed by GustavoLVJardim\nfor the The Odin Project"
   
 end

 def game_board
  board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

  
  dict_board = {
    "1" => [0, 0], "2" => [0, 1], "3" => [0, 2],
    "4" => [1, 0], "5" => [1, 1], "6" => [1, 2],
    "7" => [2, 0], "8" => [2, 1], "9" => [2, 2]
  }
  
  
  puts ""
  board.each { |row| puts row.join(" | ") }
   
 end

 def puts_the_rules
  puts""
  gets.chomp
  puts "THE RULES!"
  puts "The rules are simple: each game has five rounds.\nThe one who achieves the most\nvictories in the best of five wins."
  gets.chomp
  puts ""
  puts "If there is a tie, no points are awarded but the\nround is counted anyway."
  gets.chomp
  puts ""
  puts "At the end of the five rounds, if the tie persists,\nwe go to \"sudden death\":\nwhoever wins the first round wins the game."    
  puts ""
  gets.chomp
  puts "Good game!!!"
  puts ""
end

 def take_name_player
  puts "What's your name, player 1?"
  name_player1 = gets.chomp
  puts "Hello, #{name_player1}! You will be the \"x\""
  puts ""
  puts "What's your name, player 2?"
  name_player2 = gets.chomp
  puts "Hello, #{name_player2}! You will be the \"-\""
  
  return name_player1, name_player2
 end

 

def clear_screen
  system("clear") || system("cls")
end

def score()
  puts ""
  puts "Player 1: #{@names[0]} vs Player 2: #{@names[1]}"
  puts ""
  puts "Score => Player 1: #{0} | Player 2: #{0}"
  game_board
end

def full_board?(board)
  board.all? { |row| row.all? { |cell| cell == "x" || cell == "-" } }
end


def the_game
  board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]




  dict_board = {
  "1" => [0, 0], "2" => [0, 1], "3" => [0, 2],
  "4" => [1, 0], "5" => [1, 1], "6" => [1, 2],
  "7" => [2, 0], "8" => [2, 1], "9" => [2, 2]
  }

  current_player = 0  
  round = 1  


  result = true
  while result  
    puts "Round => #{round} <= Plays: #{@names[current_player]}"
   
    choice = gets.chomp

    if @names[current_player] == @names[0]
      print_choice = 'x'

    elsif @names[current_player] == @names[1]
      print_choice = '-'
    end


  if dict_board.key?(choice)
    system("clear")
    row, col = dict_board[choice]  
    board[row][col] = print_choice          
  end


  board.each { |row| puts row.join(" | ") } 


  condition_victory = [
    [board[0][0], board[0][1], board[0][2]],
    [board[1][0], board[1][1], board[1][2]],
    [board[2][0], board[2][1], board[2][2]],
    [board[0][0], board[1][0], board[2][0]],
    [board[0][1], board[1][1], board[2][1]],
    [board[0][2], board[1][2], board[2][2]],
    [board[0][0], board[1][1], board[2][2]],
    [board[2][0], board[1][1], board[0][2]]
  ]

  if condition_victory.any? { |line| line.uniq.length == 1 } 
    puts "#{@names[current_player]} wins!"
    result = false
    break
  end

  
  if full_board?(board)
    puts "Tie!"
    result = false
    break
  end



current_player = (current_player == 0) ? 1 : 0
round += 1

end




end







end

game = Game.new()
game.begin_screen
game.game_board
game.puts_the_rules
game.clear_screen
game.name_players
game.clear_screen
game.score
game.the_game
