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
     a = cell[0]
     b = cell[1]
     @neighbors = [
       [(a+1),b], [(a+1),(b+1)], [(a+1), (b-1)], [(a-1), b], [(a-1), (b+1)],
       [(a-1), (b-1)], [a, (b-1)], [a, (b+1)]
     ]
     @neighbors
   end
 end
