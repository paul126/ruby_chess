class King < SteppingPiece

  DELTAS = [
    [1, 0],
    [1, 1],
    [1, -1],
    [0, 1],
    [0, -1],
    [-1, 0],
    [-1, 1],
    [-1, -1]
  ]

  def display
    (@color == "black") ? "\u265A" : "\u2654"
  end

end
