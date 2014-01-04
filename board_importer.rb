require_relative './board'

class BoardImporter
  attr_reader :initial_board

  def initialize(file)
    @initial_board = File.open(file) do |file|
      file.read
    end
  end

  def grouped_cells # aware that this should be a private method, but feel that it is more important to test this. Maybe class missing, but trivial
    initial_board.split.map do |row|
      row.chars.map(&:to_i)
    end
  end

  def board
    Board.new(grouped_cells)
  end
end
