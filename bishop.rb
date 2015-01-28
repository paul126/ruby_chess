class Bishop < SlidingPiece

  DELTAS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

  def display
    (@color == "black") ? "B" : "b"
  end

end
