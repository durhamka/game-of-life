class Cell
  attr_accessor :x, :y, :board, :cell

  def initialize(board, x, y, cell)
    @board = board
    @x = x
    @y = y
    @cell = cell
    find_neighbors
  end

  def next_state
    if alive? && (alive_neighbor_count == 3 || alive_neighbor_count == 2)
      1
    elsif alive? && alive_neighbor_count < 2
      0
    elsif alive? && alive_neighbor_count > 3
      0
    elsif !alive? && alive_neighbor_count == 3
      1
    else
      0
    end
  end

  private

  def first_row?
    x == 0
  end

  def alive?
    if cell == 1
      true
    else
     false
    end
  end

  def last_row?
    x == (board.length - 1)
  end

  def first_column?
    y == 0
  end

  def last_column?
    y == (board.length - 1)
  end

  def find_neighbors
    @neighbors = []
    unless first_row?
      unless first_column?
        @neighbors << board[x-1][y-1]
      end
      @neighbors << board[x-1][y]
      unless last_column?
        @neighbors << board[x-1][y+1]
      end
    end

    unless first_column?
      @neighbors << board[x][y-1]
    end

    unless last_column?
      @neighbors << board[x][y+1]
    end

    unless last_row?
      unless first_column?
        @neighbors << board[x+1][y-1]
      end
      @neighbors << board[x+1][y]

      unless last_column?
        @neighbors << board[x+1][y+1]
      end
    end
  end

  def alive_neighbor_count
    @neighbors.count(1)
  end

  def state
    cell
  end
end
