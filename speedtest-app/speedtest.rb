require 'speedtest'
require 'json'
require 'mqtt'

test = Speedtest::Test.new(
  download_runs: 4,
    upload_runs: 4,
    ping_runs: 4,
    download_sizes: [750, 1500],
    upload_sizes: [10000, 400000],
    debug: false
 )


results = test.run
hash = {"latency":results.latency,"download_speed":results.download_rate,"upload_speed":results.upload_rate}

client = MQTT::Client.new
client.host = ENV["MQTT_HOST"]
client.connect()
client.publish("speedtest/network/state", hash.to_json, retain=false)
