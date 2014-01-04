require 'rspec'
require_relative './board_importer'

describe BoardImporter do
  describe '#grouped_cells' do
    it 'converts the board into a matrix of integers' do
      file = 'initial_board.txt'
      board_importer = BoardImporter.new(file)
      grouped_cells = board_importer.grouped_cells

      expect(grouped_cells).to eq([[0,1,0,0,0],
                                   [1,0,0,1,1],
                                   [1,1,0,0,1],
                                   [0,1,0,0,0],
                                   [1,0,0,0,1]])
    end
  end
end
