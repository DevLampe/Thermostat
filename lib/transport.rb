require 'mqtt'
require 'json'

class Transport
    def get_connection
        puts "MQTT:"
        temperature_topic = 'softwareengineering/thermostat/cfbnik/temperature'
        MQTT::Client.connect('mqtt.labict.be') do |client|
            while(true)
                client.get(temperature_topic) do |topic, message|
                    json = message
                    hash = JSON.parse(json)
                    temp = (hash["temperature"]).to_f
                    @on_change_block.call(temp) unless @on_change_block.nil?
                end
            end
        end
    end

    def on_change &block
        @on_change_block = block
    end

    def send_color(color)
        connection = MQTT::Client.connect('mqtt.labict.be')
        my_hash = {"color" => color}
        payload = JSON.generate(my_hash) # convert my_hash to JSON
        connection.publish('softwareengineering/thermostat/cfbnik/led', payload, retain = false)
    end
end
