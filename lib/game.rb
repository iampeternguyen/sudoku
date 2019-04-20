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

    end
  end

  def get_position
    puts ""
  end

  def get_value
  end

end