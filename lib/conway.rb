# frozen_string_literal: true
 #hi
 class Board
   attr_accessor :board

   def initialize(size)
     @board = Array.new(size, Array.new(size, false))
   end

 end
