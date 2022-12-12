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
            puts '(be sure to add a comma between each coordinate square)'

            user_input = gets.chomp.upcase.split(", ")
            if @board_player.valid_placement?(@player_cruiser, user_input) == true
                @board_player.place(@player_cruiser, user_input)
            else @board_player.valid_placement?(@player_cruiser, user_input) == false
                puts 'Those are invalid coordinates. Please try again:'
                user_input = gets.chomp.upcase.split(", ")
            end

            puts "Enter the squares for the Submarine (2 spaces):"
            user_input = gets.chomp.upcase.split(", ")
            if @board_player.valid_placement?(@player_submarine, user_input) == true
                @board_player.place(@player_submarine, user_input)
               puts board_player.render(true)
            else @board_player.valid_placement?(@player_submarine, user_input) == false
                puts 'Those are invalid coordinates. Please try again:'
                user_input = gets.chomp.upcase.split(", ")
            end
                puts "GET READY TO PLAAAAAAY!!!!"         
                turn
    end

    def turn
        puts '=============COMPUTER BOARD============='
        puts @board_comp.render
        puts '=============PLAYER BOARD============='
        puts @board_player.render(true)
        puts "Enter coordinate for your shot"
        
        user_shot = gets.chomp.upcase
        if @board_comp.valid_coordinate?(user_shot) == true
            @board_comp.cells[user_shot].fire_upon
            puts 'Shot fired'
        else
            puts 'Please enter a valid coordinate:'
            user_shot = gets.chomp.upcase
        end
        comp_fire
        results
    end


    def comp_fire
        coord_shot = @board_player.cells.keys.sample
        until @board_player.cells[coord_shot].fired_upon? == false
            coord_shot = @board_player.cells.keys.sample
        end
        @board_player.cells[coord_shot].fire_upon
        coord_shot
    end

    def results
        
        puts "Your shot on #{user_shot} was a miss."

    end
end


        #1)Need to display both boards using render method.  Will need a message saying to enter coordinates for shot.  Using gets method.  
        #2 User inputs coordinates and the computer chooses coordinates
        #3) At the end of the turn a written message will appear to report results
        
        #When the user enters a valid sequence of coordinates the ship will be placed on the board.  
        #The new board will show where the ship is placed, to the user.