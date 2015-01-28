class HumanPlayer

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def play_turn
    puts "Enter start position."
    start_pos = gets.chomp
    puts "Enter end position."
    end_pos = gets.chomp

    start_pos = start_pos.split(",").map { |num| num.to_i }
    end_pos = end_pos.split(",").map { |num| num.to_i }

    [start_pos, end_pos]
  end

end
