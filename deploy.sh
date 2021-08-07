#!/bin/bash
set -ex

echo 'Started to deploy.'

# ssh isucon10-qualify1 "cd /home/isucon/isuumo && git pull && cd /home/isucon/isuumo/webapp/go && make all && sudo systemctl restart mysql && sudo systemctl restart isuumo.go && sudo systemctl restart nginx && sudo sysctl -p"

ssh isucon@18.182.2.100 "cd /home/isucon/isuumo && git pull && cd /home/isucon/isuumo/webapp/go && /home/isucon/local/go/bin/go build -o isuumo && sudo systemctl restart mysql && sudo systemctl restart isuumo.go && sudo systemctl restart nginx && sudo sysctl -p && bash /home/isucon/isuumo/webapp/mysql/db/init.sh"

echo 'Finished to deploy.'
