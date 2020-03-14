#!/usr/bin/env bash

cd /data/todoapp
if [ -f ./tmp/pids/server.pid ]; then
    kill -9 $(cat tmp/pids/server.pid)
fi
