class Game
  def name_players
    @names = take_name_player()
    puts "The name is saved here: #{@names}"
    
   end

 def begin_screen
   
   puts "WELCOME TO TIC TAC TOE CLI GAME!"
   puts "This is a game by The Odin Project"
   
 end

 def gameboard
   array1 = ["__", "|","__","|","__"]
   array2 = ["__", "|","__","|","__"]
   array3 = ["  ", "|","  ","|","  "]
   puts ""
   
   print *array1
   puts ""
   print *array2
   puts ""
   print *array3
   puts ""
   puts ""
   puts "Let's play!"
   
 end

 def take_name_player
   puts "What's your name, player 1?"
   name_player1 = gets.chomp
   puts "Hello, #{name_player1}!"

   puts "What's your name, player 2?"
   name_player2 = gets.chomp
   puts "Hello, #{name_player2}!"

   return name_player1, name_player2
 end

 def puts_the_rules
   puts""
   puts "THE RULES!"
   puts "The rules are simple: each game has five rounds.\nThe one who achieves the most\nvictories in the best of five wins."
   puts ""
   puts "If there is a tie, no points are awarded but the\nround is counted anyway."
   puts ""
   puts "At the end of the five rounds, if the tie persists,\nwe go to \"sudden death\":\nwhoever wins the first round wins the game."    
   puts ""
   puts "Good game!!!"
   puts ""
 end


end

game1 = Game.new()
game1.begin_screen
game1.gameboard
game1.puts_the_rules
#game1.take_name_player
game1.name_players


