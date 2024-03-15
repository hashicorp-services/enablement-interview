echo 'export user_name="JayaShreeGit"'>> ~/.bash_profile
source ~/.bash_profile
echo $user_name
>config.hcl
echo 'cluster_addr = "https://<HOSTNAME>:8201"' >> config.hcl
echo 'api_addr = "https://<HOSTNAME>:8200"' >> config.hcl
echo 'disable_mlock = true' >> config.hcl

sed -i 's/<HOSTNAME>/vault-server.hashicorp.com/g' config.hcl