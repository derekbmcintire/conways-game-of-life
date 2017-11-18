  # frozen_string_literal: true

  # hi
  class Board
    attr_accessor :board, :new_board, :neighbors, :row, :index, :current_cell, :size

    # creates a board of any size
    def initialize(size)
      @size = size
      @board = []
      (size * size).times do
      @board.push(false)
    end
      @board = @board.each_slice(size).to_a
      @new_board = @board
      @neighbors = []
    end

    def change_cell(row, index, value)
      @board[row][index] = value
    end

    def get_cell(row, index)
      @row = row
      @index = index
      @current_cell = @board[@row][@index]
    end

    def unfiltered_neighbors
      @neighbors = [
        [(@row + 1), @index], [(@row + 1), (@index + 1)],
        [(@row + 1), (@index - 1)], [(@row - 1), @index],
        [(@row - 1), (@index + 1)], [(@row - 1), (@index - 1)],
        [@row, (@index - 1)], [@row, (@index + 1)]
      ]
    end

    def reject_neighbors
      unfiltered_neighbors
      @neighbors = @neighbors.reject { |arr|
        arr.include?(-1) || arr.include?(@size)
      }
    end

    def live_neighbors
      reject_neighbors
      @neighbors.select { |n| board[n[0]][n[1]] }
    end

    def check_change(row, index)
      get_cell(row, index)
      live_neighbors
      if @current_cell == true
        true_change
      else
        false_change
      end
      @board = @new_board
      @board
    end

    def true_change
      return unless live_neighbors.length < 2 || live_neighbors.length > 3
      @new_board[@row][@index] = false
    end

    def false_change
      return unless live_neighbors.length == 3
      @new_board[@row][@index] = true
    end

    def map_board
      flat_board = []
      @size.times do |i|
        @size.times do |j|
          flat_board.push([i, j])
        end
      end
      flat_board.map { |cell| check_change(cell[0], cell[1]) }
      @board
    end
  end

  # if cell is true
  # if live_neighbors.length is less than 2 cell is false
  # if live_neighbors.length is more than 3 cell is false
  # if cell is false
  # if live_neighbors.length is 3 cell is true
  # else cell stays the same

  # a = Board.new(5)
  # x.board[2][3] = true
  # x.board[2][0] = true
  # x.board[0][4] = true
  # x.board[0][3] = true
  # x.board[4][1] = true
  # x.board[4][3] = true
  # x.board[3][3] = true
  #
  # puts x.board
