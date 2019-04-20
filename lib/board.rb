require_relative "tile.rb"

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def render
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end

    @grid.each_with_index do |row, i|
      puts "#{row.join(' ')}"
    end
  end

  def self.grid_from_file(file)
    grid = []
    File.open(file) do |f|
      f.each_line do |line|
        grid << line.strip.split("").map do |value|
          val = value.to_i
          was_given = val != 0
          tile = Tile.new(val, was_given)
          tile
        end
      end
    end
    grid
  end

  def update_value(position, value)
    row, col = position
    @grid[row][col].change_value(value)
  end

end

if __FILE__ == $PROGRAM_NAME
  grid = Board.grid_from_file("C:\\Users\\Peter\\Documents\\Coding\\app-academy\\sudoku\\puzzles\\sudoku1.txt")
  board = Board.new(grid)
  board.render
end
