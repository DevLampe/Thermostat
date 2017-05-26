class Relais
    def set(temp, set, range)
        if temp < (set - range)
            @heating = true
            @cooling = false
        elsif temp > (set + range)
            @heating = false
            @cooling = true
        else
            @heating = false
            @cooling = false
        end
    end

    def get_heating
        "The heating is #{@heating}"
    end

    def get_cooling
        "The cooling is #{@cooling}"
    end
end
