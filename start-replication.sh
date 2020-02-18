#!/usr/bin/env sh
set -e
docker exec -ti mysql-bug_slave_1 mysql -uroot -ptest \
    -e'change master to master_host="master",master_user="repl",master_password="test",master_log_file="log-bin.000003",master_log_pos=155;' -vvv
docker exec -ti mysql-bug_slave_1 mysql -uroot -ptest -e'start slave' -vvv
