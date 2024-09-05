#!/bin/bash

# 定义一个包含域名的文件名
DOMAIN_FILE="domains.txt"

# 检查文件是否存在
if [ ! -f "$DOMAIN_FILE" ]; then
  echo "文件 $DOMAIN_FILE 不存在。请创建一个包含域名的文件。"
  exit 1
fi

# 读取域名并进行批量 ping
while IFS= read -r domain
do
  echo "Pinging $domain ..."
  ping -c 10 "$domain"
  echo "--------------------------------------"
done < "$DOMAIN_FILE"
