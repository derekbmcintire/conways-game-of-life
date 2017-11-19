  # frozen_string_literal: true

  # hi
  class Board
    attr_accessor :board, :new_board, :neighbors, :living, :row, :index, :current_cell, :size, :flat_board

    # creates a board of any size
    def initialize(size)
      @size = size
      @board = []
      @new_board = []
      @neighbors = []
      @flat_board = []
    end

    def create_board
      (size * size).times do
      board.push(0)
      end
      @board = board.each_slice(size).to_a
      @size.times do |i|
      @size.times do |j|
        flat_board.push([i, j])
      end
      end
    end

    # defines row and index of current cell, sets current_cell to value
    def get_cell(row, index)
      @row = row
      @index = index
      @current_cell = @new_board[@row][@index]
    end

    # gets coords for all potential neighbors
    def unfiltered_neighbors
      @neighbors = [
        [(@row + 1), @index], [(@row + 1), (@index + 1)],
        [(@row + 1), (@index - 1)], [(@row - 1), @index],
        [(@row - 1), (@index + 1)], [(@row - 1), (@index - 1)],
        [@row, (@index - 1)], [@row, (@index + 1)]
      ]
    end

    # rejects neighbors that don't exist
    def reject_neighbors
      unfiltered_neighbors
      @neighbors = @neighbors.reject { |arr|
        arr.include?(-1) || arr.include?(@size)
      }
    end

    # selects only neighbors that are alive
    def live_neighbors
      reject_neighbors
      @living = @neighbors.select { |n| @new_board[n[0]][n[1]] == 1 }
    end

    # checks if a cell should be changed
    def check_change(row, index)
      get_cell(row, index)
      live_neighbors
      if @current_cell == 1
        true_change
      else
        false_change
      end
      @board
    end

    # looks at a living cell and changes if needed
    def true_change
      return unless @living.length < 2 || @living.length > 3
      @board[@row][@index] = 0
    end

    # looks at a dead cell and changes if needed
    def false_change
      return unless @living.length == 3
      @board[@row][@index] = 1
    end

    # scans the board and checks each cell
    def map_board
      @new_board = @board.map(&:dup)
      @flat_board.each do |cell|
        check_change(cell[0], cell[1])
      end
      @board
    end

    # manually changes a cells value
    def change_cell(row, index, value)
      @board[row][index] = value
    end
  end

  # x.change_cell(3,5,1)
  # x.change_cell(2,5,1)
  # x.change_cell(3,6,1)
  # x.change_cell(4,5,1)
  # x.change_cell(4,4,1)
