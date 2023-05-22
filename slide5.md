layout: true
class: img-right
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide2

## Integrate Packer with Terraform (contd.)

#### Build the Image
- Validate the config file

```json
packer validate ubuntu_with_docker.json
```

- Build 

```json
packer build ubuntu_with_docker.json
```
???
Packer Commands
Once we have the packer config JSON file, we can validate and run the build using the following commands:

Validate config file

packer validate ubuntu_with_docker.json

The above command will check for syntax Validation errors, any missing variable declarations, etc.

Build an image

packer build ubuntu_with_docker.json

This will build an image and print the artifacts generated to the console. In our case, it will print the AMI ID of the provisioned image.

Note: For the above example to work, you have to export the env variables aws_access_key and aws_secret_key before running build. Also, ensure that given IAM user credentials have sufficient permissions to provision EC2.

---

