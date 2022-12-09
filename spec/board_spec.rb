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
end
