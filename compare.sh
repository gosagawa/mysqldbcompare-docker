#!/bin/bash

readonly CHECK_FROM=$1
readonly CHECK_TO=$2
readonly DB_ORIGINAL=`cat repo/config/dbName_${CHECK_TO}.conf`
readonly FILE_NAME="result_${CHECK_FROM}_${CHECK_TO}_`date "+%Y%m%d_%H%M%S"`.txt"
readonly DB_FROM="dbcompare_${CHECK_FROM}"
readonly DB_TO="dbcompare_${CHECK_TO}"

mysqldbcompare --server1=root:root@db --server2=root:root@db $DB_TO:$DB_FROM --character-set=utf8 --difftype=sql -t > /tmp/$FILE_NAME

cat /tmp/$FILE_NAME | sed "s/"${DB_TO}"/"${DB_ORIGINAL}"/" > repo/result/$FILE_NAME
echo "compare success. file -> result/"$FILE_NAME
exit 0

