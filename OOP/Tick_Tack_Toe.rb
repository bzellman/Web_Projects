class Game
	attr_accessor :l1, :l2, :l3, :c1, :c2, :c3, :r1, :r2, :r3, :player, :legal_moves, :won, :spaces
	@@spaces = ["l1","l2","l3","c1","c2","c3","r1","r2","r3"]

	def initialize
		set_new_game
	end

	def set_new_game
		@won = false
		@open = " "
		@l1 = @open; @c1 = @open; @r1 = @open; @l2 = @open; @c2 = @open; @r2 = @open; @l3 = @open; @c3 = @open; @r3 = @open
		@@legal_moves = @@spaces.clone
		start_game
	end

	def start_game
		puts "\n**** New Game Comencing ****"
		player_one = Player.new("X", "1")
		player_two = Player.new("O", "2")
		puts "\nPlayer 1 is: #{player_one.symbol}"
		puts "Player 2 is: #{player_two.symbol}\n\n"
		player_array = [player_one, player_two]
		display_grid
		
		while @won == false
			player_array.each do |g|
				if @won == false
					play_game(g)
				end
			end
		end
	end

	def play_game(player)
		is_Valid = false
		while is_Valid == false
			puts @@legal_moves.count
			puts @@spaces.count
			puts "Player #{player.num}: Choose A Square"
			player_move = gets.chomp
			player_move = player_move.downcase
			is_Valid = validate_move(player_move, player)	
			check_won(player)
			if @@legal_moves.count == 0
				set_new_game
			end
		end
	end

	def check_won(player)
		if player.check_if_won == true
			puts "Player #{player.num} won!"
			@won = true
			return true
		else
			return false
		end
	end

	def validate_move(move, player)
		if @@legal_moves.include?(move) 
			@@legal_moves.delete(move)
			player.moves << move
			puts player.moves
			instance_variable_set("@#{move}", player.symbol)
			display_grid
			return true
		else
			puts "\nPlease try again, that was not a valid move"
			display_grid
			return false
		end
	end

	def display_grid
		puts "   L   C   R \n1| #{@l1} | #{@c1} | #{@r1} |\n2| #{@l2} | #{@c2} | #{@r2} |\n3| #{@l3} | #{@c3} | #{@r3} |\n\n"
		return
	end


	class Player
		attr_accessor :symbol, :moves, :num

		def initialize(symbol, num)
			@num = num
			@symbol = symbol
			@moves = []
		end

		def check_if_won

			def check_win(array_to_compare)
				winning_arrays = [['l1','c2','r3'],['l3','c2','r1'], ['l1','l2','l3'], ['c1','c2','c3'], ['r1','r2','r3'], ['l1','c1','r1'], ['l2','c2','r2'], ['l3','c3','r3']]
				winning_arrays.each do |a| 
					if check_function(a, array_to_compare) == true
						return true
					end
				end
				return false
			end

			def check_function(winning_array, array_to_compare)
				array_to_compare.each do |i|
					if winning_array.include?(i)
						winning_array.delete(i)
					end

					if winning_array == []
						return true
					end
				end
				return false
			end

			if @moves.count < 3
				return false
			else
				return check_win(@moves)
			end
		end
	end
end


game_new = Game.new