#!/bin/bash -e

host="host/host-01.node-basic-secrets.demo"
read -s -p "Enter API key for $host: " api_key
echo ""

env CONJUR_AUTHN_LOGIN=$host CONJUR_AUTHN_API_KEY=$api_key conjur env run -- node app
