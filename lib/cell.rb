class Cell
    
    attr_reader :coordinate
    
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
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

    def fired_upon?
        @fired_upon
    end
    
    def fire_upon
        @fired_upon = true
        @ship.hit unless @ship == nil
    end

    def render(show = false)
        if show == true && @ship != nil
            "S"
        elsif @fired_upon == true && @ship == nil
            "M"
        elsif @fired_upon == true && @ship.sunk?
            "X"
        elsif @fired_upon == true && @ship != nil
            "H"
        else @fired_upon == false
            "."
        end
    end


end