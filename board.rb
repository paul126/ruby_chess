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
        @board[row][i] = Rook.new([row, i], color, @board) if i == 0 || i == 7
        @board[row][i] = Knight.new([row, i], color, @board) if i == 1 || i == 6
        @board[row][i] = Bishop.new([row, i], color, @board) if i == 2 || i == 5
        @board[row][i] = Queen.new([row, i], color, @board) if i == 3 && color == color1
        @board[row][i] = Queen.new([row, i], color, @board) if i == 4 && color == color2
        @board[row][i] = King.new([row, i], color, @board) if i == 4 && color == color1
        @board[row][i] = King.new([row, i], color, @board) if i == 3 && color == color2
      end
      color == color1 ? (row = 1) : (row = 6)
      @board[row].each_index do |i|
        @board[row][i] = Pawn.new([row, i], color, @board)
      end
    end
    nil
  end

  def in_check?(color)
    king_position = find_king_position(color)
    find_all_possible_moves(color).include?(king_position)
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
    duped_board = Array.new(8) { Array.new(8) }
    @board.each_with_index do |rows, x|
      rows.each_with_index do |tile, y|
        duped_board[x][y] = tile.deep_dup unless tile.nil?
        duped_board[x][y].board = duped_board
      end
    end
    duped_board
  end

  def find_all_possible_moves(color)
    possible_moves = []

    @board.flatten.each do |tile|
      next if tile.nil? || tile.color == color
      possible_moves += tile.moves unless tile.moves.empty?
    end
    possible_moves
  end

  def move(start_pos, end_pos)

    sx = start_pos[0]
    sy = start_pos[1]
    ex = end_pos[0]
    ey = end_pos[1]

    piece = @board[sx][sy]
    if piece.moves.include?(end_pos)
      @board[ex][ey] = piece
      piece.current_position = [ex, ey]
      @board[sx][sy] = nil
    else
      raise ArgumentError.new "Piece cannot move that way."
    end
    nil

  end













end
