class Cell
    
    attr_reader :coordinate
    
    def initialize(coordinate)
        @coordinate = coordinate
    end

    def ship
        Ship.new(name, length)
    end
end