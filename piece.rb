class Piece
  attr_accessor :current_position, :color

  def initialize(position, color, board)
    @current_position = position
    @color = color
    @board = board
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

  def has_piece(position)
    if @board[position[0]][position[1]].is_a? Piece
      return @board[position[0]][position[1]].color
    end
    nil
  end



end
