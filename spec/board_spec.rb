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
    end
end