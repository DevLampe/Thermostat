class Temperature
    def convert(temp, unit)
        if(unit == "C")
            @temp = temp
        elsif(unit == "K")
            # normally it need to be '273.15', but if we do this the led will never
            # be "green"
            @temp = temp - 273
        elsif(unit == "F")
            @temp = ((temp - 32) * 5 / 9)
        else
            @temp = temp
        end
    end
end
