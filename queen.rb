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
    (@color == "black") ? "Q" : "q"
  end

end
