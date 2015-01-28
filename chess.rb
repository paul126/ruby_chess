class Chess

  attr_accessor :game_board, :player1_turn

  def initialize
    @game_board = Board.new
    @player1 = HumanPlayer.new("black")
    @player2 = HumanPlayer.new("white")
    @game_board.generate_board(@player1.color, @player2.color)
    @player1_turn = true
  end

  def play

    until @game_board.checkmate?(@player1.color) ||
          @game_board.checkmate?(@player2.color)
      print_current_board
      puts "Current Turn: #{current_turn}"
      begin
        move_arr = ask_for_move
        @game_board.move(move_arr[0], move_arr[1], current_color)
      rescue ArgumentError
        puts "Invalid move."
        retry
      end
      switch_turn
    end
  end

  def current_color
    @player1_turn ? @player1.color : @player2.color
  end

  def current_turn
    @player1_turn ? "Player 1" : "Player 2"
  end

  def ask_for_move
    @player1_turn ? @player1.play_turn : @player2.play_turn
  end

  def switch_turn
    @player1_turn = !@player1_turn
  end

  def test_method
    puts @game_board.in_check?("white")
    print_current_board
    @game_board.board[6][3] = nil
    @game_board.board[1][3] = nil
    print_current_board
    puts @game_board.in_check?("white")
    print_current_board


  end

  def print_current_board
    @game_board.board.each do |row|
      row.each do |tile|
        if tile.nil?
          print "+"
        else
          print tile.display
        end
      end
      print "\n"
    end
    nil
  end



end
