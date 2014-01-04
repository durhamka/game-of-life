require 'rspec'
require_relative './cell'

describe Cell do
  describe '#next_state' do
    context 'when the cell is alive' do
      it 'returns a 1 if it has 3 alive neighbors' do
        board = [[1,1],
                 [1,1]]
        cell = Cell.new(board, 0, 0, 1)

        expect(cell.next_state).to eq(1)
      end

      it 'returns a 1 if it has 2 alive neighbors' do
        board = [[1,1],
                 [1,0]]
        cell = Cell.new(board, 0, 0, 1)

        expect(cell.next_state).to eq(1)
      end

      it 'returns a 0 if it has less than 2 alive neighbors' do
        board = [[1,0],
                 [1,0]]
        cell = Cell.new(board, 0, 0, 1)

        expect(cell.next_state).to eq(0)
      end

      it 'returns a 0 if it has more than 3 alive neighbors' do
        board = [[1,1,1],
                 [1,1,1],
                 [0,1,1]]
        cell = Cell.new(board, 1, 1, 1)

        expect(cell.next_state).to eq(0)
      end
    end

    context 'when a cell is dead' do
      it 'returns a 1 if it has exactly 3 alive neighbors' do
        board = [[0,1,1],
                 [1,1,1],
                 [0,1,1]]
        cell = Cell.new(board, 0, 0, 1)

        expect(cell.next_state).to eq(1)
      end

      it 'returns a 0 if it has 2 or any other alive neighbors other than 3' do
        board = [[0,0,1],
                 [1,1,1],
                 [0,1,0]]
        cell = Cell.new(board, 0, 0, 0)

        expect(cell.next_state).to eq(0)
      end
    end
  end
end
