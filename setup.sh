#cluster_addr  = "https://<HOSTNAME>:8201"
#api_addr      = "https://<HOSTNAME>:8200"
#disable_mlock = true
#!/bin/bash

# Set environment variable with your github username in /root/.bash_profile
echo 'export GITHUB_USERNAME=<your_github_username>' >> /root/.bash_profile

# Create config.hcl file
cat <<EOF > config.hcl
cluster_addr  = "https://<HOSTNAME>:8201"
api_addr      = "https://<HOSTNAME>:8200"
disable_mlock = true
EOF