#!/bin/bash

mysql --defaults-extra-file=repo/config/dbConnection_docker.conf -e "DROP DATABASE IF EXISTS dbcompare_dev"
mysql --defaults-extra-file=repo/config/dbConnection_docker.conf -e "DROP DATABASE IF EXISTS dbcompare_stg"

mysql --defaults-extra-file=repo/config/dbConnection_docker.conf -e "CREATE DATABASE dbcompare_dev CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql --defaults-extra-file=repo/config/dbConnection_docker.conf -e "CREATE DATABASE dbcompare_stg CHARACTER SET utf8 COLLATE utf8_general_ci;"

cat repo/dump/dev.dump > /tmp/dev.dump
cat repo/dump/stg.dump > /tmp/stg.dump

# カラムに作成日時や更新日時が含まれていたら以下のようにして消す
# cat repo/dump/dev.dump | sed "s/'[^']*','[^']*');$/'2019-01-01 00:00:00','2019-01-01 00:00:00');/" > /tmp/dev.dump
# cat repo/dump/stg.dump | sed "s/'[^']*','[^']*');$/'2019-01-01 00:00:00','2019-01-01 00:00:00');/" > /tmp/stg.dump

mysql --defaults-extra-file=repo/config/dbConnection_docker.conf dbcompare_dev < /tmp/dev.dump
mysql --defaults-extra-file=repo/config/dbConnection_docker.conf dbcompare_stg < /tmp/stg.dump

echo "ready success"
exit 0
