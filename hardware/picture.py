import board
import neopixel
from picamera import PiCamera
from time import sleep
import os
import requests

url = "http://dc847acfe5fa.ngrok.io/pic_upload"
pixels = neopixel.NeoPixel(board.D18, 24)

camera = PiCamera()
camera.start_preview()

pixels.fill((255, 255, 255))
sleep(1)
camera.capture('/home/pi/Desktop/hackitshipit/img.jpg')
sleep(1)
files = {'file': open('/home/pi/Desktop/hackitshipit/img.jpg', 'rb')}
response = requests.request("POST", url, files=files)
print(response.text)
pixels.fill((0, 0, 0))
camera.stop_preview()

#camera.start_preview()
#for i in range(5):
#    pixels.fill((255, 255, 255))
#    camera.capture('/home/pi/Desktop/thales/banana5/img%s.jpg' % i)
#    pixels.fill((0, 0, 0))
#    sleep(2)
    



