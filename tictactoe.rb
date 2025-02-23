class Game
  @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]

  def begin_screen
    puts
    puts 'WELCOME TO TIC TAC TOE CLI GAME!'
    puts
    puts "This game was developed by GustavoLVJardim\nfor the The Odin Project"

    [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def name_players
    @names = take_name_player

    @names
  end

  def game_board
    board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]

    puts ''
    board.each { |row| puts row.join(' | ') }
  end

  def puts_the_rules
    puts ''
    gets.chomp
    puts 'THE RULES!'
    puts "The rules are simple: each game has three rounds.\nThe one who achieves the most\nvictories in the best of three wins."
    gets.chomp
    puts ''
    puts "If there is a tie, no points are awarded but the\nround is counted anyway."
    gets.chomp
    puts ''
    puts "At the end of the three rounds, if the tie persists,\nwe go to \"sudden death\":\nwhoever wins the first round wins the game."
    puts ''
    gets.chomp
    puts 'Good game!!!'
    puts ''
  end

  def take_name_player
    puts "What's your name, player 1?"
    name_player1 = gets.chomp
    puts "Hello, #{name_player1}! You will be the \"x\""
    puts ''
    puts "What's your name, player 2?"
    name_player2 = gets.chomp
    puts "Hello, #{name_player2}! You will be the \"-\""

    [name_player1, name_player2]
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def score
    puts ''
    puts "Player 1: #{@names[0]} vs Player 2: #{@names[1]}"
    puts ''
    game_board
  end

  def full_board?(board)
    board.all? { |row| row.all? { |cell| ['x', '-'].include?(cell) } }
  end

  def the_game
    dict_board = {
      '1' => [0, 0], '2' => [0, 1], '3' => [0, 2],
      '4' => [1, 0], '5' => [1, 1], '6' => [1, 2],
      '7' => [2, 0], '8' => [2, 1], '9' => [2, 2]
    }

    current_player = 0
    round = 1
    scores = { @names[0] => 0, @names[1] => 0 }

    while round <= 3
      board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      puts ''
      puts "Round #{round} - #{@names[current_player]} starts!"
      puts ''
      loop do
        puts "Who Plays => #{@names[current_player]}"
        choice = gets.chomp

        print_choice = @names[current_player] == @names[0] ? 'x' : '-'

        if dict_board.key?(choice)
          system('clear')
          row, col = dict_board[choice]
          board[row][col] = print_choice
        end

        board.each { |row| puts row.join(' | ') }

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
          puts "#{@names[current_player]} wins the round!"
          scores[@names[current_player]] += 1
          break
        end

        if full_board?(board)
          puts 'Tie! No points awarded.'
          break
        end
        current_player = current_player.zero? ? 1 : 0
      end
      round += 1
    end
    if scores[@names[0]] == scores[@names[1]]
      puts "It's a tie! Entering sudden death..."
      loop do
        board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
        puts "Sudden Death! #{@names[current_player]} starts!"
        loop do
          puts "Who Plays => #{@names[current_player]}"
          choice = gets.chomp
          print_choice = @names[current_player] == @names[0] ? 'x' : '-'
          if dict_board.key?(choice)
            system('clear')
            row, col = dict_board[choice]
            board[row][col] = print_choice
          end
          board.each { |row| puts row.join(' | ') }
          if condition_victory.any? { |line| line.uniq.length == 1 }
            puts "#{@names[current_player]} wins the game in sudden death!"
            return
          end
          if full_board?(board)
            puts 'Tie! Restarting sudden death round.'
            break
          end
          current_player = current_player.zero? ? 1 : 0
        end
      end
    else
      winner = scores[@names[0]] > scores[@names[1]] ? @names[0] : @names[1]
      puts "#{winner} wins the game!"
    end
  end
end


