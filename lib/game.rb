require './lib/ship'
require './lib/cell'
require './lib/board'

class Game

        attr_reader :board_comp, :board_player

    def initialize
        @board_comp = Board.new
        @board_player = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)

        @comp_cruiser = Ship.new("Cruiser", 3)
        @comp_submarine = Ship.new("Submarine", 2)

    end

    def start
        puts 'Welcome to BATTLESHIP'
        puts 'Enter p to play. Enter q to quit.'
        
        user_input = gets.chomp.upcase
        if user_input == 'P'
            place_comp_ships
            game_start
        elsif user_input == 'Q'
               #exits game         
        else
            start
        end    
    end

    def valid_comp_coordinates(ship)
        coordinates = []
        until @board_comp.valid_placement?(ship, coordinates)
            coordinates = @board_comp.cells.keys.sample(ship.length)
        end
        coordinates
    end

    def place_comp_ships
        ships = [@comp_cruiser, @comp_submarine]
        ships.each do |ship|
            coordinates = valid_comp_coordinates(ship)
            @board_comp.place(ship, coordinates)
        end
    end

    def game_start
            puts 'I have laid out my ships on the grid.'
            puts 'You now need to lay out your two ships.'
            puts 'The Cruiser is three units long and the Submarine is two units long.'
            puts    '  1 2 3 4'
            puts    'A . . . .'
            puts    'B . . . .'
            puts    'C . . . .'
            puts    'D . . . .'
            puts  'Enter the squares for the Cruiser (3 spaces):'
    end
end


        #1) computer will place their ship using random placement using valid placement rules.   
            #potentially using the valid_placement method and place_ship method
        #2) message sent to use that computer's ships have been placed. 
             # message second line User needs to choose coordinates to place their ship
        #3) User input needed use .gets method.  
            #conditionals needed to  possibly if its good will print message saying its good.  using valid_placement & place_ship methods
            #   if the coordinates aren't valid  using conditionals a message will print saying not valid and to try again


        #4) Next, the user places their ships. They should receive a short explanation of how to place along with a visual representation of their board (which should be empty).

# I have laid out my ships on the grid.
# You now need to lay out your two ships.
# The Cruiser is three units long and the Submarine is two units long.
#   1 2 3 4
# A . . . .
# B . . . .
# C . . . .
# D . . . .
# Enter the squares for the Cruiser (3 spaces):
# >

        #5)When the user enters a valid sequence of coordinates the ship will be placed on the board.  
        #The new board will show where the ship is placed, to the user.