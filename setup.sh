#!/bin/bash

# Set GitHub username environment variable and add it to /root/.bash_profile
export GITHUB_USERNAME="https://github.com/pibulls"  
echo "export GITHUB_USERNAME=\"$GITHUB_USERNAME\"" >> /root/.bash_profile

# Creating config.hcl file
cat <<EOL > config.hcl
cluster_addr  = "https://<HOSTNAME>:8201"
api_addr      = "https://<HOSTNAME>:8200"
disable_mlock = true
EOL


# Replace placeholder with actual hostname
sed -i "s|http://127.0.0.1:35729|vault-server.hashicorp.com|g" config.hcl


echo "Setup completed!"
