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
    (@color == "black") ? "K" : "k"
  end

end
