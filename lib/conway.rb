# frozen_string_literal: true
 #hi
 class Board
   attr_accessor :board, :neighbors

   def initialize(size)
     @board = Array.new(size, Array.new(size, false))
     @neighbors = []
   end

   def get_neighbors(cell_arr)
     @board.each do |arr|
       arr.each do ||
       end
     end
   end

 end
