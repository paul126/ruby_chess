class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def generate_board(color1, color2)
    @color1 = color1
    @color2 = color2
    color_arr = [color1, color2]
    color_arr.each do |color|
      color == color1 ? (row = 0) : (row = 7)
      @board[row].each_index do |i|
        @board[row][i] = Rook.new([row, i], color, self) if i == 0 || i == 7
        @board[row][i] = Knight.new([row, i], color, self) if i == 1 || i == 6
        @board[row][i] = Bishop.new([row, i], color, self) if i == 2 || i == 5
        @board[row][i] = Queen.new([row, i], color, self) if i == 3
        @board[row][i] = King.new([row, i], color, self) if i == 4
      end
      color == color1 ? (row = 1) : (row = 6)
      @board[row].each_index do |i|
        @board[row][i] = Pawn.new([row, i], color, self)
      end
    end
    nil
  end

  def in_check?(color)
    king_position = find_king_position(color)
    find_all_opponent_moves(color).include?(king_position)
  end

  def checkmate?(color)
    in_check?(color) && find_all_self_moves(color).empty?
  end

  def find_king_position(color)
    @board.flatten.each do |tile|
      next if tile.nil?
      if tile.class == King && tile.color == color
        return tile.current_position.dup
      end
    end
    nil
  end

  def deep_dup
    duped_board = Board.new
    @board.each_with_index do |rows, x|
      rows.each_with_index do |tile, y|
        next if tile.nil?
        duped_board.board[x][y] = tile.deep_dup
        duped_board.board[x][y].board = duped_board.board
      end
    end
    duped_board
  end

  def find_all_opponent_moves(color)
    possible_moves = []

    @board.flatten.each do |tile|
      next if tile.nil? || tile.color == color
      possible_moves += tile.moves unless tile.moves.empty?
    end
    possible_moves
  end

  def find_all_self_moves(color)
    possible_moves = []

    @board.flatten.each do |tile|
      next if tile.nil? || tile.color != color
      possible_moves += tile.valid_moves unless tile.valid_moves.empty?
    end
    possible_moves
  end

  def on_board?(position)
    if position[0].between?(0, 7) && position[1].between?(0, 7)
      return true
    else
      false
    end
  end


  def move(start_pos, end_pos, current_color)

    if !on_board?(start_pos) || !on_board?(end_pos)
      raise ArgumentError.new "Move not on the board."
    end

    sx = start_pos[0]
    sy = start_pos[1]
    ex = end_pos[0]
    ey = end_pos[1]

    piece = @board[sx][sy]
    if piece.nil?
      raise ArgumentError.new "No piece selected."
    elsif piece.color != current_color
      raise ArgumentError.new "Incorrect piece selected."
    elsif piece.valid_moves.include?(end_pos)
      @board[ex][ey] = piece
      piece.current_position = [ex, ey]
      @board[sx][sy] = nil
      piece.first_move = false if piece.class == Pawn
    else
      raise ArgumentError.new "Piece cannot move that way."
    end

    nil
  end

  def move!(start_pos, end_pos, current_color)

    sx = start_pos[0]
    sy = start_pos[1]
    ex = end_pos[0]
    ey = end_pos[1]

    piece = @board[sx][sy]
    @board[ex][ey] = piece
    piece.current_position = [ex, ey]
    @board[sx][sy] = nil
    piece.first_move = false if piece.class == Pawn

    nil
  end
end
