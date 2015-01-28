class Pawn < Piece
  DELTAS = [
    [1, 0],
    [2, 0]
  ]


  def moves
    position = self.current_position.dup
    moves_arr = []
    DELTAS.each do |i|
      temp_position = [position[0] - i[0], position[1]] if self.color == "white"
      temp_position = [position[0] + i[0], position[1]] if self.color == "black"
      if on_board?(temp_position) && has_piece(temp_position).nil?
        moves_arr << temp_position
      end
    end
    moves_arr
  end

  def display
    (@color == "black") ? "P" : "p"
  end
end
