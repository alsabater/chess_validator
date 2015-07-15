require 'pry'
class Validator

	def read_file
		@file = IO.readlines("simple_moves.txt")
		length_file = @file.length
	end

	def is_legal?
		while 
		end
	end

end

class Board 
	attr_accessor :x1, :y1, :x2, :y2

	def initialize 
		@board = Array.new(8) {Array.new(8)}
	end

	def insert_piece piece, x1, y1
		@x1 = x1
		@y1 = y1
		@board[@x1][@y1] = piece.type
	end

	def move_piece x2, y2
		@x2 = x2
		@y2 = y2
		@board[@x2][@y2] = @board[@x1][@y1]
		@board[@x1][@y1] = nil
	end
end

class Piece


end

class Rook < Piece
	attr_accessor :type

	def initialize
		@type = :bR
	end

	def possible_movements movement 
		if movement.x1 == movement.x2 || movement.y1 == movement.y2
			puts "LEGAL"
		else puts "ILLEGAL"
		end
	end

end

bR = Rook.new

board = Board.new 

board.insert_piece bR, 0, 0
board.move_piece 0, 2
bR.possible_movements board
