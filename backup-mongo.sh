#!/bin/bash

# use mongo docker container to run mongodump
export COMMAND="mongodump --host $MONGO_HOST -d $MONGO_DB --port $MONGO_PORT --username $MONGO_USERNAME --password $MONGO_PASSWORD --out /home/dump --excludeCollection users"
docker run -v `pwd`/:/home/dump --rm -it mongo:3.4.10 bash -c "$COMMAND"
# tar and compress the dump
mkdir -p target/latest
tar -czf $MONGO_DB.tar.gz ./$MONGO_DB/
mv $MONGO_DB.tar.gz target/latest/
