require 'Rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe do
    it 'exists' do
        cell = Cell.new("B4")
        expect(cell).to be_an_instance_of(Cell)
    end
    
    it 'has coordinates' do
        cell = Cell.new("B4")
        expect(cell.coordinate).to eq("B4")
    end

    it 'can test for ship and empty cell' do
        cell = Cell.new("B4")
        cell.ship
        expect(cell.empty?).to eq(false)

    end
end