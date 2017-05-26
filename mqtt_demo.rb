require "mqtt"

temperature_topic = 'softwareengineering/thermostat/cfbnik/temperature'

MQTT::Client.connect('mqtt.labict.be') do |client|
    while true
        client.get(temperature_topic) do |topic, message|
            puts "#{topic}: #{message}"
        end
    end
end
