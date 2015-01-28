class Rook < SlidingPiece

  DELTAS = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  def display
    (@color == "black") ? "R" : "r"
  end

end
