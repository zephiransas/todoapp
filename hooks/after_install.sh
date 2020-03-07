#!/usr/bin/env bash

cd /data/todoapp
bundle config set without 'development test'
bundle install --path vendor/bundle
bundle exec rake assets:precompile