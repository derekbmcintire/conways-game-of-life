  # frozen_string_literal: true

  # hi
  class Board
    attr_accessor :board, :neighbors

    # creates a board of any size
    def initialize(size)
      @board = Array.new(size, Array.new(size, false))
      @neighbors = []
    end

  end

  class Cell < Board
    attr_accessor :row, :index

    def initialize(row, index)
      @row = row
      @index = index
    end

    def get_unfiltered_neighbors
      @neighbors = [
        [(@row + 1), @index], [(@row + 1), (@index + 1)],
        [(@row + 1), (@index - 1)], [(@row - 1), @index],
        [(@row - 1), (@index + 1)], [(@row - 1), (@index - 1)],
        [@row, (@index - 1)], [@row, (@index + 1)]
      ]
    end

    def get_neighbors
      get_unfiltered_neighbors
      @neighbors.reject { |arr| arr.include?(-1) }
    end

  end
