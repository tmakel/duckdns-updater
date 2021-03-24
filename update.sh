#!/bin/bash

## Fetch token from file
CONFIG_FILE=$(dirname "$0")"/config.cfg"

## 
TOKEN=""
DOMAINS=""

## Load config file
[ -r "$CONFIG_FILE" ] && . "$CONFIG_FILE"

## Fetch current WAN IPv4 address
IP_DETECT_URL=`curl -s 'http://checkip.dyndns.com/'`
IP=`echo $IP_DETECT_URL | grep -Po "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"`

## IP auto detect update url
UPDATE_URL='https://www.duckdns.org/update?domains='$DOMAINS'&token='$TOKEN'&verbose=true'

## Explicit update url
UPDATE_URL='https://www.duckdns.org/update?domains='$DOMAINS'&ip='$IP'&token='$TOKEN'&verbose=true'

## Update ip request
RESPONSE=`curl -s "$UPDATE_URL"`

echo $RESPONSE

## Write API response to syslog
logger 'duckdns-updater: '$RESPONSE
