class Board
    attr_reader :cells,
                :consecutive

    def initialize
        @cells = cells
    end

    def cells
        cells ={
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
            }
        
    end

    def valid_coordinate?(a_cell)
        cells.include?(a_cell)     
    end

    def valid_placement?(ship_type, array_coor)
        ship_type.length == array_coor.length && valid_coordinates?(array_coor)
    end
    
    def valid_coordinates?(array_coor)
        letters = array_coor.map { |coordinate| coordinate.split(//).first.ord}
        numbers = array_coor.map { |coordinate| coordinate.split(//).last.to_i}
        
        return true if letters.each_cons(2).all? {|a, b| a == b} && numbers.each_cons(2).all? {|num1, num2| num1 + 1 == num2}
            
        return true if letters.each_cons(2).all? {|a, b| a + 1 == b} && numbers.each_cons(2).all? {|num1, num2| num1 == num2}

        false
    end
end