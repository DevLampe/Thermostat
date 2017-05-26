require 'date'

class Log
    def initialize()
        @file = "log.txt"
    end

    def addContent(content)
        date = Time.now.strftime("%d/%m/%Y %H:%M")
        File.open(@file, 'a+') do |file|
            file.puts("#{date}: \n")
            file.puts("#{content} \n")
            file.puts("\n")
        end
    end
end
