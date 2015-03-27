require 'colorize'

require_relative("./pieces/piece.rb")

require_relative("./pieces/sliding_piece.rb")
require_relative("./pieces/stepping_piece.rb")

require_relative("./pieces/bishop.rb")
require_relative("./pieces/king.rb")
require_relative("./pieces/knight.rb")
require_relative("./pieces/pawn.rb")
require_relative("./pieces/queen.rb")
require_relative("./pieces/rook.rb")

require_relative("./game/board.rb")

require_relative("./game/chess.rb")

require_relative("./game/human_player.rb")

Chess.new.play
