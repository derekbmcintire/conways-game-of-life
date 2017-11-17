# frozen_string_literal: true
 #hi
 class Board
   attr_accessor :board, :neighbors

   def initialize(size)
     @board = Array.new(size, Array.new(size, false))
   end

   def get_neighbors(cell)
     @neighbors = []
   end

 end
