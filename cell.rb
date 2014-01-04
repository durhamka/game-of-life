class Cell
  attr_accessor :x, :y, :board

  def initialize(board, x, y)
    @board = board
    @x = x
    @y = y
    find_neighbors
  end

  def state
    board[x][y]
  end

  def next_state
    if alive? && (alive_neighbor_count == 3 || alive_neighbor_count == 2)
      1
    elsif alive? && (alive_neighbor_count < 2 || alive_neighbor_count > 3)
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
    board[x][y] == 1
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
    collect_top_neighbors
    collect_middle_neighbors
    collect_bottom_neighbors
  end

  def collect_top_neighbors
    return if first_row?

    unless first_column?
      @neighbors << board[x-1][y-1]
    end
    @neighbors << board[x-1][y]
    unless last_column?
      @neighbors << board[x-1][y+1]
    end
  end

  def collect_middle_neighbors
    unless first_column?
      @neighbors << board[x][y-1]
    end

    unless last_column?
      @neighbors << board[x][y+1]
    end
  end

  def collect_bottom_neighbors
    return if last_row?
    unless first_column?
      @neighbors << board[x+1][y-1]
    end
    @neighbors << board[x+1][y]

    unless last_column?
      @neighbors << board[x+1][y+1]
    end
  end

  def alive_neighbor_count
    @neighbors.count(1)
  end
end
