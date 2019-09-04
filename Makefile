
ssh:
	docker-compose exec web bash

ready:
	docker-compose exec web bash repo/ready.sh

compare_dev_stg:
	docker-compose exec web bash repo/compare.sh dev stg

compare_stg_dev:
	docker-compose exec web bash repo/compare.sh stg dev

dump_all: dump_dev dump_stg

dump_dev:
	mysqldump --defaults-extra-file=config/dbConnection_dev.conf `cat config/dbName_dev.conf` `cat config/masterList.conf` --column-statistics=0 --single-transaction --skip-extended-insert > dump/dev.dump

dump_stg:
	mysqldump --defaults-extra-file=config/dbConnection_stg.conf `cat config/dbName_stg.conf` `cat config/masterList.conf` --column-statistics=0 --single-transaction --skip-extended-insert > dump/stg.dump

