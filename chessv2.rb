require 'pry'


class Board 
	attr_accessor :position

	def initialize 
		@board = IO.readlines("theboard.txt")
		@board.map! { |piece| piece.split}
		@board.map! do |x|
			x.map! do |cell|
				cell.to_sym
			end
		end
	end

	def translate_position position
		@position = position.split("")
		@position_x = @position[0]
		@position_y = @position[1].to_i
		case @position_x
		when "a"
			@position_x = 0
		when "b"
			@position_x = 1
		when "c"
			@position_x = 2
		when "d"
			@position_x = 3
		when "e"
			@position_x = 4
		when "f"
			@position_x = 5
		when "g"
			@position_x = 6
		when "h"
			@position_x = 7
		end
		@position = [@position_x, @position_y]
	end 

	def move_piece position1, position2
		@position1 = translate_position position1
		@position2 = translate_position position2
		@board[@position2[0]][@position2[1]] = @board[@position1[0]][@position1[1]]
		@board[@position1[0]][@position1[1]] = nil 
	end
end

class Piece
	
	def get_init_and_final_position board, position1, position2

		board.translate_position position1
		@position1 = board.position

		board.translate_position position2
		@position2 = board.position
	end

end

class Rook < Piece
	attr_accessor :type

	def possible_movement
		if @position1[0] == @position2[0] || @position1[1] == @position2[1]
		puts "LEGAL"
		else puts "ILLEGAL"
		end
	end

end

class Validator

	def initialize initial_pos, final_pos
		@board = Board.new
		@board.move_piece initial_pos, final_pos
		binding.pry
	end
end


start_game = Validator.new "a1", "a3"