require './lib/ship'
require './lib/cell'
require './lib/board'

class Game

        attr_reader 

    def initialize
        
    end
    

    def start
        puts 'Welcome to BATTLESHIP'
        puts 'Enter p to play. Enter q to quit.'
        
        user_input = gets.chomp.upcase
        if user_input == 'P'
            game_start
        elsif user_input == 'Q'
            game_end            
        else
            start
        end    
    end

    def game_start


    

        #1) computer will place their ship using random placement using valid placement rules.   
            #potentially using the valid_placement method and place_ship method
        #2) message sent to use that computer's ships have been placed. 
             # message second line User needs to choose coordinates to place their ship
        #3) User input needed use .gets method.  
            #conditionals needed to  possibly if its good will print message saying its good.  using valid_placement & place_ship methods
            #   if the coordinates aren't valid  using conditionals a message will print saying not valid and to try again


        

    end
end
