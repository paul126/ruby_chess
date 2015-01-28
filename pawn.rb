class Pawn < Piece
  attr_accessor :first_move
  DELTAS = [
    [1, 0],
    [2, 0]
  ]

  CAPTURE_DELTAS = [
    [1, 1],
    [1, -1]
  ]

  def initialize(position, color, board_object)
    super(position, color, board_object)
    @first_move = true
  end

  def moves
    position = self.current_position.dup
    moves_arr = []
    DELTAS.each do |i|
      temp_position = [position[0] - i[0], position[1]] if self.color == "white"
      temp_position = [position[0] + i[0], position[1]] if self.color == "black"
      if !has_piece(temp_position).nil?
        break
      elsif on_board?(temp_position) && has_piece(temp_position).nil?
        moves_arr << temp_position
      end
    end

    moves_arr.pop if !@first_move && moves_arr.length > 1

    CAPTURE_DELTAS.each do |i|
      if self.color == "white"
        temp_position = [position[0] - i[0], position[1] + i[1]]
      elsif self.color == "black"
        temp_position = [position[0] + i[0], position[1] + i[1]]
      end

      if on_board?(temp_position) &&
         has_piece(temp_position) != self.color &&
         !has_piece(temp_position).nil?

        moves_arr << temp_position
      end
    end

    moves_arr
  end

  def display
    (@color == "black") ? "\u265F" : "\u2659"
  end
end
