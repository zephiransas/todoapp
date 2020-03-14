#!/usr/bin/env bash

cd /data/todoapp
source ./export_config.sh
bundle config set without 'development test'
bundle install
yarn install
RAILS_ENV=production bundle exec rake assets:precompile
