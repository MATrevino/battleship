require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
    it 'exists' do
        game = Game.new
        expect(game).to be_an_instance_of(Game)
    end

    it 'gives attributes for board and ships exist' do
        game = Game.new
        board_comp = Board.new
        board_player = Board.new
        player_cruiser = Ship.new("Cruiser", 3)
        player_submarine = Ship.new("Submarine", 2)
        comp_cruiser = Ship.new("Cruiser", 3)
        comp_submarine = Ship.new("Submarine", 2)

        expect(board_comp).to be_an_instance_of(Board)
        expect(board_player).to be_an_instance_of(Board)
        expect(player_cruiser).to be_an_instance_of(Ship)
        expect(player_submarine).to be_an_instance_of(Ship)
        expect(comp_cruiser).to be_an_instance_of(Ship)
        expect(comp_submarine).to be_an_instance_of(Ship)
    end
        
    xit 'it gives results' do
        game = Game.new
        board_comp = Board.new
        board_player = Board.new
        player_cruiser = Ship.new("Cruiser", 3)
        player_submarine = Ship.new("Submarine", 2)
        comp_cruiser = Ship.new("Cruiser", 3)
        comp_submarine = Ship.new("Submarine", 2)

        board_comp.place(comp_cruiser, ["A1", "A2", "A3"])
        
        expect(board_comp.cells.results_player("A1")).to eq("H")
    end
end
#Ran out fo time and was unable to finish writing test 