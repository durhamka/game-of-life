require 'rspec'
require_relative './board'

describe Board do
  describe '#to_s' do
    it 'returns a string of the board' do
      board = Board.new([[0,0,0,0,0]])

      expect(board.to_s).to eq('00000')
    end

    it 'returns a string of the board with multiple rows' do
      board = Board.new([[0,0,0,0,0],
                        [1,0,1,0,1]])

      expect(board.to_s).to eq("00000\n10101")
    end
  end

  describe '#next_board' do
    it 'returns the correct next board for the game' do
      board = Board.new([[1,0],
                         [1,1]])
      next_board = board.next_board

      expect(next_board.to_s).to eq("11\n11")
    end
  end
end
