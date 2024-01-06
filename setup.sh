#!/bin/bash

# Determine the OS
OS="$(uname)"

# Set the environment variable
if [[ "${OS}" == "Linux" ]]; then
 echo 'export GITHUB_USERNAME=<your_username>' >> /root/.bash_profile
elif [[ "${OS}" == "Darwin" ]]; then
 echo 'export GITHUB_USERNAME=<your_username>' >> /Users/<your_username>/.bash_profile
else
 echo "Unknown OS"
 exit 1
fi

# Define the HOSTNAME
HOSTNAME="vault-server.hashicorp.com"

# Write the code to config.hcl
cat <<EOF > config.hcl
cluster_addr = "https://${HOSTNAME}:8201"
api_addr   = "https://${HOSTNAME}:8200"
disable_mlock = true
EOF
