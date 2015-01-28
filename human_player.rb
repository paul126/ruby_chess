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
    begin
      puts "Enter start position."
      start_pos = gets.chomp.upcase.split('')
      puts "Enter end position."
      end_pos = gets.chomp.upcase.split('')
    unless start_pos.length == 2 && end_pos.length == 2
      raise ArgumentError.new "Too many characters."
    end
    unless start_pos[0].between?("A", "H") && end_pos[0].between?("A", "H")
      raise ArgumentError.new "Invalid letter input."
    end
    unless start_pos[1].between?("1", "8") && end_pos[1].between?("1", "8")
      raise ArgumentError.new "Invalid number input."
    end
    rescue ArgumentError => e
      puts "#{e.message}"
      retry
    end

    start_pos.map! { |i| POSITION_CONVERSION[i] }
    end_pos.map! { |i| POSITION_CONVERSION[i] }
    # start_pos = start_pos.split(",").map { |num| num.to_i }
    # end_pos = end_pos.split(",").map { |num| num.to_i }

    [start_pos.reverse, end_pos.reverse]
  end

end
