require_relative "board.rb"
SUDOKU_PATH = "C:\\Users\\Peter\\Documents\\Coding\\app-academy\\sudoku\\puzzles\\sudoku1.txt"
GRID = Board.grid_from_file(SUDOKU_PATH)

class Game
  def initialize
    @board = Board.new(GRID)

  end

  def play
    while !@board.solved?
      @board.render
      position = get_position
      value = get_value
      @board.update_value(position,value)
    end

    puts "Congrats! You Win!"
  end

  def get_position
    puts "Select position"
    input = gets.chomp.split(" ").map {|loc| loc.to_i}
    if input.length == 2
      return input
    else
      puts "Invalid position"
      get_position
    end
  end

  def get_value
    puts "Select value"
    input = gets.chomp.to_i
    if input > 0 || input <= 9
      return input
    else
      puts "Invalid value. Select numbers from 1-9"
      get_value
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end