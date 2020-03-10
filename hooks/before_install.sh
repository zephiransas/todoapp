#!/usr/bin/env bash

export RDS_DB_NAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_DB_NAME' | jq -r '.Parameter.Name')
export RDS_USERNAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_USERNAME' | jq -r '.Parameter.Name')
export RDS_PASSWORD=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_PASSWORD' | jq -r '.Parameter.Name')
export RDS_HOSTNAME=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_HOSTNAME' | jq -r '.Parameter.Name')
export RDS_PORT=$(aws --region ap-northeast-1 ssm get-parameter --name '/Todoapp/RDS/RDS_PORT' | jq -r '.Parameter.Name')
