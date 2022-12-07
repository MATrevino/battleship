class Cell
    
    attr_reader :coordinate
    
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
    end

    def ship
      @ship
    end


    def empty?
        if @ship == nil
            true
        else 
            false
        end
    end

    def place_ship(a_ship)
        @ship = a_ship
    end
end