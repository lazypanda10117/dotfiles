import os
import requests
import json

url = "https://freegeoip.app/json/"

headers = {
    'accept': "application/json",
    'content-type': "application/json"
}

try:
    response = json.loads(requests.request("GET", url, headers=headers).text)
    location = response.get('time_zone')
    print(location)
    os.system('timedatectl set-timezone {}'.format(location))
except Exception as e:
    print(e)

