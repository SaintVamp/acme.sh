#!/bin/sh

HOSTS="404.svsoft.fun 2804.svsoft.fun 207.svsoft.fun"
DOMAINS="svsoft.fun efdata.fun"
PORT=45001

for HOST in $HOSTS; do
    echo "start trans $HOST"
    for DOMAIN in $DOMAINS; do
      scp -P "$PORT" "/root/.acme.sh/$DOMAIN/$DOMAIN.cer" "root@$HOST:/etc/nginx/ca/"
      scp -P "$PORT" "/root/.acme.sh/$DOMAIN/$DOMAIN.key" "root@$HOST:/etc/nginx/ca/"
    done
    ssh -p "$PORT" "root@$HOST" "/etc/init.d/nginx reload"
done
echo "trans done"