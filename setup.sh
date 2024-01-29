echo "export GHUSERNAME=tiger-rh" >> /root/bash-profile

echo 'cluster_addr  = "https://<HOSTNAME>:8201"' >> config.hcl
echo 'api_addr      = "https://<HOSTNAME>:8200"' >> config.hcl
echo 'disable_mlock = true' >> config.hcl

VARNAME="<HOSTNAME>"
SERVERNAME=vault-server.hashicorp.com

sed -i "" "s/$VARNAME/$SERVERNAME/" config.hcl
