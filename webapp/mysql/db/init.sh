#!/bin/bash
set -xe
set -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
export MYSQL_HOST_ESTATE=${MYSQL_HOST_ESTATE:-54.249.178.112}
export MYSQL_HOST_CHAIR=${MYSQL_HOST_CHAIR:-3.112.48.202}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucon}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isuumo}
export MYSQL_PWD=${MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 0_Schema.sql 1_DummyEstateData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_ESTATE -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME
cat 0_Schema.sql 2_DummyChairData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_CHAIR -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME
