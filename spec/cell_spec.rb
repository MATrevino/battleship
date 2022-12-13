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
        cruiser = Ship.new("Cruiser", 3)
        cell = Cell.new("B4")
        cell.ship
        expect(cell.empty?).to eq(true)
    end
    
    it 'has ship after placing ship' do
        cruiser = Ship.new("Cruiser", 3)
        cell = Cell.new("B4")

        cell.place_ship(cruiser)
        cell.ship
        expect(cell.empty?).to be(false)
    end

    it 'knows when fired upon' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to eq(false)
       
        cell.fire_upon
        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to eq(true)
    end

    it 'can render the cell to change with no ship' do
        cruiser = Ship.new("Cruiser", 3)
        cell_1 = Cell.new("B4")
        cell_2 = Cell.new("C3")
        cell_2.place_ship(cruiser)
        expect(cell_1.render).to eq(".")

        cell_1.fire_upon
        expect(cell_1.render).to eq("M")
    end

    it 'can render the cell with a ship' do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)

        cell_2.place_ship(cruiser)
        expect(cell_2.render).to eq(".")
        expect(cell_2.render(true)).to eq("S")

        cell_2.fire_upon
        expect(cell_2.render).to eq("H")
        expect(cruiser.sunk?).to eq(false)

        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to eq(true)
        expect(cell_2.render).to eq("X")
    end

end