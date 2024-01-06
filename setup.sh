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

# Set the environment variable
echo 'export GITHUB_USERNAME=user_name_here' >> /root/.bash_profile
