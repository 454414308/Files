#!/bin/bash

# 定义一个包含域名的文件名
DOMAIN_FILE="domains.txt"

# 检查文件是否存在
if [ ! -f "$DOMAIN_FILE" ]; then
  echo "文件 $DOMAIN_FILE 不存在。请创建一个包含域名的文件。"
  exit 1
fi

# 批量 ping 并提取平均响应时间
while IFS= read -r domain
do
  echo "Pinging $domain ..."
  
  # 执行ping命令并提取平均时间
  avg_time=$(ping -c 10 "$domain" | awk -F'/' 'END{ print $5 }')

  if [ -z "$avg_time" ]; then
    echo "$domain: 无法解析域名或网络连接错误"
  else
    echo "$domain 的平均响应时间: $avg_time ms"
  fi
  echo "--------------------------------------"
done < "$DOMAIN_FILE"
