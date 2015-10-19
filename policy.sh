#!/bin/bash -e

# Load the policy
conjur policy load --as-group security_admin --collection demo policy.rb

# Create the host and grant layer membership
conjur host create host-01.node-basic-secrets.demo | tee host.json
conjur layer hosts add demo/node-basic-secrets/app host-01.node-basic-secrets.demo

# Populate the secret
conjur variable values add demo/node-basic-secrets/secret_key $(openssl rand -hex 16)

