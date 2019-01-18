#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -z "${APP_ENV}:" ]] ; then
  if [[ $# -eq 0 ]] ; then
      echo "Syntax: $0 <environment>"
      exit 1
  else
    APP_ENV=$1
  fi
fi

cd /var/www/admin
echo "running in $APP_ENV"
gosu www-data app/console --env="$APP_ENV" os2display:core:cron