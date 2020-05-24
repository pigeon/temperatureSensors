require 'open_weather'
require 'mqtt'
require 'json'



def get_weather(client)
    options = { units: "metric", APPID: ENV["API_KEY"] }
    weather = OpenWeather::Current.geocode(ENV["LAT"], ENV["LNG"] , options)
    weather_hash = {"temperature":weather["main"]["temp"],"humidity":weather["main"]["humidity"]}
    client.publish("openweather/web/temperature", weather_hash.to_json, retain=false)
end

client = MQTT::Client.new
client.host = ENV["MQTT_HOST"]
client.connect()

get_weather(client)

