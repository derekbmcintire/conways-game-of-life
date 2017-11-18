  # frozen_string_literal: true

  # hi
  class Board
    attr_accessor :board, :neighbors, :row, :index, :current_cell

    # creates a board of any size
    def initialize(size)
      @board = @board = []
      (size * size).times do
      @board.push(false)
    end
      @board = @board.each_slice(size).to_a
      @neighbors = []
    end

    def change_cell(row, index, value)
      @board[row][index] = value
    end

    def get_cell(row, index)
      @row = row
      @index = index
      @current_cell = [@row, @index]
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
      @neighbors = @neighbors.reject { |arr| arr.include?(-1) }
    end

    def get_live_neighbors
      @neighbors.select { |n| board[n[0]][n[1]] }
    end

  end
