require 'colorize'

class Led
    def check_led(temp, set, range)
        if(temp < (set - range))
            @color = "0000FF".colorize(:blue)
            @fcolor = "0000FF"
        elsif(temp > (set + range))
            @color = "FF0000".colorize(:red)
            @fcolor = "FF0000"
        else
            @color = "00FF00".colorize(:green)
            @fcolor = "00FF00"
        end
    end

    def get_led
        "The LED is #{@color}"
    end

    def get_color
        return @fcolor
    end

    def get_fcolor
        "The LED is #{@fcolor}"
    end
end
