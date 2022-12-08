require 'Rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe do
    it 'exists' do

        board = Board.new
        expect(board).to be_an_instance_of(Board)
    end
end