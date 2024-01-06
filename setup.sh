#!/bin/bash

# Determine the OS
OS="$(uname)"

# Set the environment variable
if [[ "${OS}" == "Linux" ]]; then
 echo 'export GITHUB_USERNAME=jcpopdigital' >> /root/.bash_profile
elif [[ "${OS}" == "Darwin" ]]; then
 echo 'export GITHUB_USERNAME=jcpopdigital' >> /Users/jcpopdigital/.bash_profile
else
 echo "Unknown OS"
 exit 1
fi
