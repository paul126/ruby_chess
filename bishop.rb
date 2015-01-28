class Bishop < SlidingPiece

  DELTAS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

  def display
    (@color == "black") ? "\u265D" : "\u2657"
  end

end
