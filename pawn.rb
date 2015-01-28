class Pawn < Piece
  DELTAS = [
    [1, 0]
  ]


  def moves
    position = self.current_position.dup
    moves_arr = []
    position[0] -= DELTAS[0][0] if self.color == "white"
    position[0] += DELTAS[0][0] if self.color == "black"
    if on_board?(position) && has_piece(position).nil?
      moves_arr << position
    end
    moves_arr
  end
end
