#!/bin/bash

[[ $LOGSTASH_TRACE ]] && set -x

SCRIPT_ROOT=$(readlink -f "$(dirname "$0")")

# If you don't provide a value for the LOGSTASH_CONFIG_URL env
# var, your install will default to our very basic logstash.conf file.
#
LOGSTASH_DEFAULT_CONFIG_URL='https://gist.githubusercontent.com/pblittle/1b7a2f02cd16fa1c58e9/raw/logstash_nxt.conf'
LOGSTASH_CONFIG_URL=${LOGSTASH_CONFIG_URL:-${LOGSTASH_DEFAULT_CONFIG_URL}}

LOGSTASH_SRC_DIR='/opt/logstash'

LOGSTASH_CONFIG_DIR="${LOGSTASH_SRC_DIR}/conf.d"
LOGSTASH_CONFIG_FILE="${LOGSTASH_CONFIG_DIR}/logstash.conf"

LOGSTASH_BINARY="${LOGSTASH_SRC_DIR}/bin/logstash"

LOGSTASH_LOG_DIR='/var/log/logstash'
LOGSTASH_LOG_FILE="${LOGSTASH_LOG_DIR}/logstash.log"

KIBANA_CONFIG_FILE="${LOGSTASH_SRC_DIR}/vendor/kibana/config.js"
