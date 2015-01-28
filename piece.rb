class Piece
  attr_accessor :current_position, :color, :board

  def initialize(position, color, board_object)
    @current_position = position
    @color = color
    @board_object = board_object
    @board = @board_object.board
  end

  def moves
    #returns an array of all the pieces possible moves
  end

  def on_board?(position)
    if position[0].between?(0, 7) && position[1].between?(0, 7)
      return true
    else
      false
    end
  end

  def move_into_check?(position)
    duped_board = @board_object.deep_dup
    start_position = @current_position.dup
    duped_board.move(start_position, position)
    duped_board.in_check?(@color)
  end

  def valid_moves
    possible_moves = moves
    possible_moves.reject! {|position| move_into_check?(position)}
    possible_moves
  end

  def deep_dup
    duped_piece = self.dup
    duped_piece.current_position = @current_position.dup
    duped_piece
  end

  def has_piece(position)
    if @board[position[0]][position[1]].is_a? Piece
      return @board[position[0]][position[1]].color
    end
    nil
  end



end
