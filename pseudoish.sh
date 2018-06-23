#!/usr/bin/sh

curl -c ../script/cookie-$1.txt --data "edit[id]=$1&edit[pass]=$2&op=Einloggen&edit[method]=&edit[form_id]=account_login"  https://***/account/login


returnDE=$(curl -b ../script/cookie-$1.txt http://***/4 | jq 'if .won_item.name == "Item1" then "Item_Name1" elif .won_item.name == "Item2" then "Item_Name2" else "Error" end')

if [[ "$returnDE" == *"Error"* ]]; then
	echo "Wait"
else
	gewinnDE=$(echo "$returnDE")
	echo "`date` | DE: $gewinnDE" >> /var/www/html/list/$1-Output.txt
	echo "1Chest at `date +%H:%M --date '+6 hour'` Uhr." > /var/www/html/list/$1-Time.txt
	curl -b ../script/cookie-$1.txt http://***/de
fi


returnEN=$(curl -b ../script/cookie-$1.txt http://***/2 | jq 'if .won_item.name == "Item1" then "Item_Name1" elif .won_item.name == "Item2" then "Item_Name2" else "Error" end')
if [[ "$returnEN" == *"Error"* ]]; then
	echo "Wait"
else
        gewinnEN=$(echo "$returnEN")
        echo "`date` | EN: $gewinnEN" >> /var/www/html/list/$1-Output.txt
		echo "2Chest at `date +%H:%M --date '+6 hour'` Uhr." >> /var/www/html/list/$1-Time.txt
	curl -b ../script/cookie-$1.txt http://***/wtfr
fi


returnFR=$(curl -b ../script/cookie-$1.txt http://***/6 | jq 'if .won_item.name == "Item1" then "Item_Name1" elif .won_item.name == "Item2" then "Item_Name2" else "Error" end')
if [[ "$returnFR" == *"Error"* ]]; then
	echo "Wait"
else
        gewinnFR=$(echo "$returnFR")
        echo "`date` | FR: $gewinnFR" >> /var/www/html/list/$1-Output.txt
		echo "3Chest at `date +%H:%M --date '+6 hour'` Uhr." >> /var/www/html/list/$1-Time.txt
	curl -b ../script/cookie-$1.txt http://***/fr
fi
echo "End"
