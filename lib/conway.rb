# frozen_string_literal: true
 #hi
 class Board
   attr_accessor :board, :neighbors

   def initialize(size)
     @board = Array.new(size, Array.new(size, false))
     @neighbors = []
   end

   # cell is an array like [1,0]
   def get_neighbors(cell)
     @board.length.times do |i|
       current_cell = [i]
       arr.length.times do |j|
         current_cell.push(j)
         @neighbors.push(current_cell)
       end
     end
   end

 end
