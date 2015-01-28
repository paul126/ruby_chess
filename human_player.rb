class HumanPlayer

  POSITION_CONVERSION = {
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
    "H" => 7,
    "8" => 0,
    "7" => 1,
    "6" => 2,
    "5" => 3,
    "4" => 4,
    "3" => 5,
    "2" => 6,
    "1" => 7,
  }

  attr_accessor :color, :name

  def initialize(color)
    @color = color
  end

  def play_turn
    puts "Enter start position."
    start_pos = gets.chomp.upcase.split('')
    puts "Enter end position."
    end_pos = gets.chomp.upcase.split('')

    start_pos.map! { |i| POSITION_CONVERSION[i] }
    end_pos.map! { |i| POSITION_CONVERSION[i] }
    # start_pos = start_pos.split(",").map { |num| num.to_i }
    # end_pos = end_pos.split(",").map { |num| num.to_i }

    [start_pos.reverse, end_pos.reverse]
  end

end
