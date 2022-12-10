require 'Rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe do
    it 'exists' do

        board = Board.new
        expect(board).to be_an_instance_of(Board)
        expect(board.cells.keys.length).to eq(16)
        expect(board.cells.class).to eq(Hash)
    end

    it 'validates coordinates' do

        board= Board.new
    
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'validates placement based on length' do

        board= Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 

        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)

    end

    it 'validates consecutive placement' do

        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    end

    it 'validates placement if diagonal' do

        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 

        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'will place the ships' do

        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"] 
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
         
        expect(cell_1.ship).to eq(cruiser) 
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)

        cell_3.ship == cell_2.ship
    end

    it 'ensures ships do not overlap' do

        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        
        board.place(cruiser, ["A1", "A2", "A3"])

        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq (false)
    end

    it 'displays a rendering of the board' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["A1", "A2", "A3"])

        expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
end
