class SlidingPiece < Piece

  def moves
    moves_arr = []

    self.class::DELTAS.each do |delta|
      position = self.current_position.dup
      until true == false
        position[0] += delta[0]
        position[1] += delta[1]

        if !on_board?(position)
          break
        elsif self.color == has_piece(position)
          break
        elsif has_piece(position).nil? && !on_board?(position)
          break
        elsif on_board?(position) && !has_piece(position).nil?
          moves_arr << position.dup
          break
        elsif on_board?(position)
          moves_arr << position.dup
        else
          break
        end
      end
    end
    moves_arr
  end


end
