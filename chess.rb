class Chess

  attr_accessor :game_board

  def initialize
    @game_board = Board.new
  end

  def play
    @game_board.generate_board("black", "white")
    print_current_board

    #test cases
    @game_board.board[0][1].moves
    @game_board.board[1][0] = nil
    @game_board.board[0][0].moves

  end

  def print_current_board

    @game_board.board.each do |row|
      row.each do |tile|
        print "P" if tile.is_a? Pawn
        print "R" if tile.is_a? Rook
        print "H" if tile.is_a? Knight
        print "B" if tile.is_a? Bishop
        print "K" if tile.is_a? King
        print "Q" if tile.is_a? Queen
        print "+" if tile.nil?
      end
      puts ""
    end
    nil
  end



end
