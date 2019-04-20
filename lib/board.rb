require_relative "tile.rb"
require "colorize"
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
    puts "  #{(0...@grid.length).to_a.join(' ')}".colorize(:red)

    @grid.each_with_index do |row, i|
      puts "#{i}".colorize(:red) + " #{row.join(' ')}"
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

  def solved?
    lines = get_all_lines
    lines.all? {|line| is_line_solved?(line)}
  end

  def get_all_lines
    lines = []

    # Get rows
    @grid.each do |row|
      lines << row
    end

    # Get columns
    (0...@grid.length).each do |col|
      column_lines = []
      (0...@grid.length).each do |row|
        column_lines << @grid[row][col]
      end
      lines << column_lines
    end


    # Get boxes
    box1, box2, box3, box4, box5, box6, box7, box8, box9 = [], [], [], [], [], [], [], [], []
    (0..2).each do |row|
      (0..2).each do |col|
        box1 << @grid[row][col]
        box2 << @grid[row][col+3]
        box3 << @grid[row][col+6]
        box4 << @grid[row+3][col]
        box5 << @grid[row+3][col+3]
        box6 << @grid[row+3][col+6]
        box7 << @grid[row+6][col]
        box8 << @grid[row+6][col+3]
        box9 << @grid[row+6][col+6]
      end
    end
    lines += [box1, box2, box3, box4, box5, box6, box7, box8, box9]
    lines
  end

  def is_line_solved?(line)
    solved = [1,2,3,4,5,6,7,8,9]
    sorted = (line.map {|tile| tile.value}).sort
    sorted == solved
  end

end

if __FILE__ == $PROGRAM_NAME
  grid = Board.grid_from_file("C:\\Users\\Peter\\Documents\\Coding\\app-academy\\sudoku\\puzzles\\sudoku1_solved.txt")
  board = Board.new(grid)
  puts board.solved?
end
