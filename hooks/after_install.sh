#!/usr/bin/env bash

export RDS_DB_NAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_DB_NAME' | jq -r '.Parameter.Value')
export RDS_USERNAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_USERNAME' | jq -r '.Parameter.Value')
export RDS_PASSWORD=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_PASSWORD' | jq -r '.Parameter.Value')
export RDS_HOSTNAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_HOSTNAME' | jq -r '.Parameter.Value')
export RDS_PORT=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_PORT' | jq -r '.Parameter.Value')
export RAILS_MASTER_KEY=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RAILS_MASTER_KEY' | jq -r '.Parameter.Value')

cd /data/todoapp
bundle config set without 'development test'
bundle install
yarn install
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rails s