require_relative './cell'

class Board
  attr_reader :cells, :board

  def initialize(board)
    @cells = []
    board.each_with_index do |row, x|
      @cells[x] = []
      row.each_with_index do |cell, y|
        @cells[x] << Cell.new(board, x, y)
      end
    end
  end

  def to_s
    cells.map do |row|
      row.map(&:state).join('')
    end.join("\n")
  end

  def next_board
    board = []
    cells.each_with_index do |row, x|
      board[x] = []
      row.each_with_index do |cell, y|
        board[x] << cell.next_state
      end
    end
    Board.new(board)
  end
end
