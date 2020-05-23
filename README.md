# 433mhz temperature sensors

I had a chat with a friend of a friend during Christmas time about a correlation of outside temperature and the natural gas bill and how good it would be to forecast these things. After this conversation, I thought that it would be great to collect temperatures in the different places in the house. The main reason for this is that the house is not as warm as I would want and when we insulate it we need to have numbers to compare. "It's got a bit warmer" sounds a way too subjective. 

## Sensors

I was looking for something that can be connected to and controlled by raspberry pi which I already got. After a bit of googling I went for this [sensor](https://www.banggood.com/Digoo-DG-R8H-433MHz-Wireless-Digital-Hygrometer-Thermometer-Weather-Station-Sensor-for-TH11300-8380-p-1178108.html) mostly because it is cheap, there is no problem how to power it and there are open source libraries that can decode signal from the sensor.

## 433mhz receiver 

I left buying receiver until the very end because I have seen there are quite a lot available on Amazon. However, to my surprise, it took me almost two weeks to find the receiver that would work adequately. 

![image](images/433mhz_receiver_sr.jpg) 

This one was  receiving a signal in a range of 1m.


![image](images/433mhz_receiver_nw.jpg) 

This one I haven't been able to get working at all. 


![image](images/433mhz_receiver.jpg)

The one that I eventually used for this project is RXB6 433Mhz Superheterodyne Wireless Receiver

## Raspberry pi and configuration

This was probably the easiest part of the project. Mostly because there is a brilliant [guide](https://github.com/aquaticus/nexus433) from [aquaticus](https://github.com/aquaticus) which has a step-by-step instruction and great explanation how to connect 433mhz receiver and configure a service for decoding sensors signal. 

There are couple of things I want to mention here. the first one is that I had a problem to configure `libgpiod` library because of the missing linux kernel headers. There are workarounds described in this [issue](https://github.com/aquaticus/nexus433/issues/21) and they worked for me.

![image](images/Digoo_DG-R8S.png)

Another thing is that if somehow you would get hold of *Digoo DG-R8S 433MHz* (on the picture above) it won't work out of the box because it uses different protocol but there is a [PR](https://github.com/aquaticus/nexus433/pull/16) that works for  *Digoo DG-R8S 433MHz* and for *Digoo-DG-R8H 433MHz* sensors.

## Grafana Dashboard 

When everything was wired and configured I hooked it up to homeassistant and it look pretty cool! 

![Image](images/homeassistant.png)

However I wanted my dashboard a bit more flexible and I want to have all sensor temperatures on one graph. I could quicly find how to do it in the homeassistant (or most likely I just wanted to play with grafana) so I started exploring how I can present this data with in grafana dashboard.  