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

        letters = array_coor.map { |coordinate| coordinate.split(' ').first.ord}
        numbers = array_coor.map { |coordinate| coordinate.split(//).last.to_i}
        
        if ship_type.name == "Cruiser"
            if array_coor.length == 3
                if letters.each_cons(3).all? {|a, b, c| a == b && b == c}
                    if numbers.each_cons(3).all? {|num1, num2, num3| num1 + 1 == num2 && num2 + 1 == num3}
                        true
                    else
                        false
                    end
                elsif letters.each_cons(3).all? {|a, b, c| a + 1 == b && b + 1 == c}
                    if numbers.each_cons(3).all? {|num1, num2, num3| num1 == num2 && num2 == num3}
                        true
                    else
                        false
                    end
                else
                    false
                end
        else
            false
        end
        elsif ship_type.name == "Submarine"
            if array_coor.length == 2
                if letters.each_cons(2).all? {|a, b| a == b}
                    if numbers.each_cons(2).all? {|num1, num2| num1 +1 == num2}
                        true
                    else
                        false
                    end
                elsif letters.each_cons(2).all? {|a, b| a + 1 == b}
                    if numbers.each_cons(2).all? {|num1, num2| num1 == num2}
                        true
                    else
                        false
                    end
                end
            else
                false
            end
        end
    end

    # def consecutive?(coordinates)
    #     split_coordinates = []
    
    #     coordinates.each do |one_cell|
    #        split_coordinates << one_cell.split(//).flatten!
    #     end

    #     if split_coordinates[3].to_i - split_coordinates[1].to_i == 1 || split_coordinates[2].ord - split_coordinates[0].ord == 1
    #         true
    #     else
    #         false
    #     end

    # end
 

end