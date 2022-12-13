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
            exit        
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
        puts '  1 2 3 4'
        puts 'A . . . .'
        puts 'B . . . .'
        puts 'C . . . .'
        puts 'D . . . .'
        puts 'Enter the squares for the Cruiser (3 spaces):'
        puts '(be sure to add a comma between each coordinate)'

        player_place_cruiser
    end

    def player_place_cruiser

        user_input = gets.chomp.upcase.split(", ")
        if @board_player.valid_placement?(@player_cruiser, user_input) == true
            @board_player.place(@player_cruiser, user_input)
        else @board_player.valid_placement?(@player_cruiser, user_input) == false
            puts 'Those are invalid coordinates. Please try again:'
            player_place_cruiser
        end
        player_place_submarine
    end

    def player_place_submarine
        puts "Enter the squares for the Submarine (2 spaces):"
        puts '(be sure to add a comma between each coordinate)'
        user_input = gets.chomp.upcase.split(", ")
        if @board_player.valid_placement?(@player_submarine, user_input) == true
            @board_player.place(@player_submarine, user_input)
           puts board_player.render(true)
        else @board_player.valid_placement?(@player_submarine, user_input) == false
            puts 'Those are invalid coordinates. Please try again:'
            player_place_submarine
        end
        puts "GET READY TO PLAAAAAAY!!!!"         
        turn
    end     

    def turn
        until @player_cruiser.sunk? && @player_submarine.sunk? || @comp_cruiser.sunk? && @comp_submarine.sunk?
            puts '=============COMPUTER BOARD============='
            puts @board_comp.render
            puts '=============PLAYER BOARD============='
            puts @board_player.render(true)
            puts "Enter coordinate for your shot:"
            player_shot
        end
    end
    
    def player_shot
        @user_shot = gets.chomp.upcase
        if @board_comp.valid_coordinate?(@user_shot) == true && 
            @board_comp.cells[@user_shot].fired_upon? == false
            @board_comp.cells[@user_shot].fire_upon
        elsif @board_comp.valid_coordinate?(@user_shot) == true && 
            @board_comp.cells[@user_shot].fired_upon? == true
            puts "You've already shot that coordinate, try again:"
            player_shot
        else @board_comp.valid_coordinate?(@user_shot) == false
            puts 'Please enter a valid coordinate:'
            player_shot
        end

        comp_fire
        results_comp(@coord_shot)

        puts '=============COMPUTER BOARD============='
        puts @board_comp.render
        puts '=============PLAYER BOARD============='
        puts @board_player.render(true)
        if @player_cruiser.sunk? && @player_submarine.sunk?
            puts "I won!"   
        else @comp_cruiser.sunk? && @comp_submarine.sunk?
            puts "You won. You beat the computer. Aren't you clever?"
        end
        puts "++++++++++++++++++++++++++++++++++++++++++++++"
        start
    end


    def comp_fire
        @coord_shot = @board_player.cells.keys.sample
        until @board_player.cells[@coord_shot].fired_upon? == false
            @coord_shot = @board_player.cells.keys.sample
        end
        @board_player.cells[@coord_shot].fire_upon
        @coord_shot
    end

    def results_player(user_shot)
        if @board_comp.cells[@user_shot].render == "M"
            puts "Your shot on #{@user_shot} was a miss."
        elsif @board_comp.cells[@user_shot].render == "H"
            puts "Your shot on #{@user_shot} was a hit."
        else @board_comp.cells[@user_shot].render == "X"
            puts "Your shot on #{@user_shot} sunk my ship!"
        end
        turn       
    end


    def results_comp(coord_shot)
        if @board_player.cells[@coord_shot].render == "M"
            puts "My shot on #{@coord_shot} was a miss."
        elsif @board_player.cells[@coord_shot].render == "H"
            puts "My shot on #{@coord_shot} was a hit."
        else @board_player.cells[@coord_shot].render == "X"
            puts "My shot on #{@coord_shot} sunk your ship!"
        end
        results_player(@user_shot)
    end
    
end
