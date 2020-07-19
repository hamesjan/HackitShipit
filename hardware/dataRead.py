import requests
import serial
import time

ser = serial.Serial('/dev/ttyACM0', 19200)
time.sleep(2)
##url = 'https://enj6o1t14ya5b.x.pipedream.net/'
url = ' http://dc847acfe5fa.ngrok.io/data'
flag = False
n=0
moved = 0
while True:

    dataRaw = ser.readline()
    print(dataRaw)
    data = str(dataRaw.strip())
    data = data.replace(" ","")
    datas = data.split("b'")
    print(len(datas))
    if len(datas)<2:
        continue
    data = datas[1]
    data = data.replace("\'","")
    print(data)
    if flag == True:
        
        motionAVG = data.partition("|")[0]
        temp = data.partition("|")[2]    
        co2Level = temp.partition("|")[0]
        temp = temp.partition("|")[2]
        tvocLevel = temp.partition("|")[0]
        temp = temp.partition("|")[2]
        temperature = temp.partition("|")[0]
        temp = temp.partition("|")[2]
        humidity = temp.partition("|")[0]
        temp = temp.partition("|")[2]
        probeTemp = temp.partition("|")[0]
        n=n+1
        

        if n == 10:
            dataObj = {'motion':motionAVG,
                    'co2':co2Level,
                    'TVOC': tvocLevel,
                    'Temperature':temperature,
                    'Humidity': humidity,
                    'ProbeT': probeTemp,}
            x = requests.post(url, data = dataObj)
            print(x.status_code)
            n=0

        # print(motionAVG)
        # print(co2Level)
        # print(tvocLevel)
        # print(temperature)
        # print(humidity)
        # print(probeTemp)

        print('Motion(avg): {}, CO2: {}, TVOC: {}, Temperature: {}, Humidity: {}, ProbeT: {}, MovedL {} '.format(motionAVG,co2Level,tvocLevel,temperature,humidity,probeTemp,moved))
    
    if (data == 'StartingDataStream'):
        print("receiving data")
        flag = True
        
