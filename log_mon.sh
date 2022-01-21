#!/bin/bash

FILE="/var/log/nginx"
SIZE=$(du -m ${FILE} | awk '{print $1}')
HOSTNAME=$(hostname)
if [ ${SIZE} -gt 1024 ]
then
	MESSAGE="${FILE}의 크기가 1GB를 초과하였습니다."
	/root/SHELL/telegram_push.sh "${HOSTNAME}" "${MESSAGE}"
fi


