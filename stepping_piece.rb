# require 'byebug'

class SteppingPiece < Piece

  def moves
    moves_arr = []
    position = self.current_position.dup
    self.class::DELTAS.each do |delta|
      poss_pos = [position[0] + delta[0], position[1] + delta[1]]
      next if !on_board?(poss_pos)
      next if self.color == has_piece(poss_pos)
      moves_arr << poss_pos if on_board?(poss_pos)
    end

    moves_arr
  end

end
