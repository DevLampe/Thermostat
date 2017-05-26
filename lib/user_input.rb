class UserInput
    def askData
        puts "Enter the temperature:"
        @temp = gets.chomp.to_f

        puts "Enter the wanted temperature:"
        @set = gets.chomp.to_f

        puts "Enter the unit:"
        @unit = gets.chomp

        puts "Enter the range:"
        @range = gets.chomp.to_f
    end

    def get_temp
        return @temp
    end

    def get_set
        return @set
    end

    def get_unit
        return @unit
    end

    def get_range
        return @range
    end
end
