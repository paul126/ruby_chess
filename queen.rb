class Queen < SlidingPiece

  DELTAS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1],
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  def display
    (@color == "black") ? "\u265B" : "\u2655"
  end

end
