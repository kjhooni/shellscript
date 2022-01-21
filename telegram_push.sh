#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage"
	echo "$0 {HOSTNAME} {MESSAGE}"
	echo "example) "
	echo "$0 cent1 message"
	exit 0
fi

#텔레그램 봇 정보
ID=[chat_id]
API_TOKEN="[api token]"
URL="https://api.telegram.org/bot${API_TOKEN}/sendMessage"

#날짜
DATE=$(date "+%Y-%m-%d %H:%M")
#봇이 내게 보낼 메세지
TEXT="${DATE} [$1] $2"

#메세지 보내기
curl -s -d "chat_id=${ID}&text=${TEXT}" ${URL} > /dev/null
