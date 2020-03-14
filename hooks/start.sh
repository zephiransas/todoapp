#!/usr/bin/env bash

cd /data/todoapp
source  ./export_config.sh
RAILS_ENV=production bundle exec rails s -d
