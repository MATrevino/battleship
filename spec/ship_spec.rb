require './lib/ship'

RSpec. describe Ship do 
    let(:cruiser) { Ship.new("Cruiser", 3)}

    it 'exists' do
        expect(cruiser).to be_an_instance_of(Ship)   
    end

    it 'has a name' do
        expect(cruiser.name).to eq('Cruiser')
    end

    it 'has a length' do
        expect(cruiser.length).to eq(3)
    end

    it 'has its health' do
        expect(cruiser.health).to eq(3)
    end

    it 'can sink?' do
        expect(cruiser.sunk?).to eq(false)
    end

    it 'can get hit' do

        cruiser.hit
    
        expect(cruiser.health).to eq(2)
    end



end