#!/bin/bash

#파티션별 사용량을 확인해서 80%이상인 파티션이 있으면 관리자에게 메세지를 보냄.
#1. 파티션별 사용량을 확인.
#2. use가 80%이상이면 관리자에게 메세지
#3. 80%미만이면 아무것도 안함.

HOST=$(hostname)
TEXT=$(df -h | awk '{gsub("%",""); USE=$5; MNT=$6; if( USE > 80 ) print MNT,"파티션이",USE,"%입니다!"}' | grep -v "^[A-Z]")

if [ ${#TEXT} -ge 1 ]
then
	/root/SHELL/telegram_push.sh "${HOST}" "${TEXT}"
fi



