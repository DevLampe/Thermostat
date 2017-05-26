require 'openssl'
require 'open-uri'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Web
    def url
        @temp = (URI.parse("https://labict.be/software-engineering/temperature/api/temperature/fake").read).to_f
        puts @temp
        return @temp
    end
end
