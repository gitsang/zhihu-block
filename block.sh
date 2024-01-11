#!/bin/bash

XSRF=""
Z_C0=""
COOKIE="_xsrf=${XSRF}; z_c0=${Z_C0};"

block() {
    USER_ID=${1}
    curl -iL -X POST \
        https://www.zhihu.com/api/v4/members/${USER_ID}/actions/block \
        -H "cookie: ${COOKIE}"
}

USER_IDS=(
    "chao-zan-bao-xiao-zhu-shou",
    "zhi-hu-ya-si",
)

for USER_ID in ${USER_IDS[@]}; do
    echo "blocking ${USER_ID}"
    block ${USER_ID}
done
