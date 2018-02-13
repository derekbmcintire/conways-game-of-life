# frozen_string_literal: true

require_relative '../lib/conway'
RSpec.describe Board do
  before :all do
    @my_board = Board.new(16)
  end

  describe 'Create Board' do
    it 'creates a new board' do
      expect(@my_board.board.length).to eq(16)
    end

    it 'creates a new flat board' do
      expect(@my_board.flat_board.length).to eq(256)
    end

    it 'creates all cells with a value of 0' do
      expect(@my_board.board[5][12]).to eq(0)
      expect(@my_board.board[1][4]).to eq(0)
      expect(@my_board.board[14][8]).to eq(0)
      expect(@my_board.board[9][5]).to eq(0)
    end

    it 'changes a cells value to 1' do
      @my_board.change_cell(3, 5, 1)
      expect(@my_board.board[3][5]).to eq(1)
    end

    it 'find a cells live neighbors' do
      @my_board.change_cell(3, 5, 1)
      @my_board.change_cell(3, 4, 1)
      @my_board.new_board = @my_board.board.map(&:dup)
      @my_board.get_cell(3,4)
      expect(@my_board.unfiltered_neighbors.length).to eq(8)
      expect(@my_board.live_neighbors.length).to eq(1)
    end

    it 'changes a cell from 1 to 0 if that cell has less than two live nieghbors' do
      @my_board.change_cell(3, 5, 1)
      @my_board.change_cell(3, 4, 1)
      expect(@my_board.board[3][4]).to eq(1)
      @my_board.map_board
      expect(@my_board.board[3][4]).to eq(0)
    end

    it 'does not change a cell that has two or three live neighbors' do
      @my_board.change_cell(3, 5, 1)
      @my_board.change_cell(3, 4, 1)
      @my_board.change_cell(4, 4, 1)
      expect(@my_board.board[3][5]).to eq(1)
      @my_board.map_board
      expect(@my_board.board[3][5]).to eq(1)
    end

    it 'changes a cell from 1 to 0 if that cell has more than three live neighbors' do
      @my_board.change_cell(3, 5, 1)
      @my_board.change_cell(3, 4, 1)
      @my_board.change_cell(4, 4, 1)
      @my_board.change_cell(4, 5, 1)
      @my_board.change_cell(2, 5, 1)
      expect(@my_board.board[3][5]).to eq(1)
      @my_board.map_board
      expect(@my_board.board[3][5]).to eq(0)
    end

    it 'changes a cell from 0 to 1 if that cell has exactly three live neighbors' do
      @my_board.change_cell(3, 5, 1)
      @my_board.change_cell(3, 6, 1)
      @my_board.change_cell(4, 5, 1)
      expect(@my_board.board[4][6]).to eq(0)
      @my_board.map_board
      expect(@my_board.board[4][6]).to eq(1)
    end
  end
end
