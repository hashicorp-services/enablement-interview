layout: true
class: img-right
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide6

## Integrate Packer with Terraform (contd.)

#### Reference Image in Terraform

```json
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}
variable "AMI_ID" {}
variable "KEY_NAME" {}

provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region = "eu-west-1"
}

resource "aws_instance" "web" {
  ami = var.AMI_ID
  instance_type = "t2.micro"
  key_name = var.KEY_NAME

  tags = {
    Name = "UbuntuWithDocker"
  }
}
```

???
- Reference the custom image in Terraform code using the appropriate data source or resource
- Example: Use the "aws_instance" resource in Terraform and specify the AMI ID as a variable

Provisioning EC2 with Terraform
It’s time to see our AMI in action. We can provision an EC2 instance with this AMI built from Packer using Terraform.

Terraform is an open-source tool to automate infrastructure provisioning (Infrastructure as code). Script to create EC2 machine,

Apply the terraform by providing the AWS credentials and AMI details,

TF_VAR_ACCESS_KEY=<YOUR_ACESS_KEY> \
TF_VAR_SECRET_KEY=<YOUR_SECRET_KEY> \
TF_VAR_AMI_ID=<YOUR_AMI_ID> \
TF_VAR_KEY_NAME=<YOUR_KEY_NAME> \

terraform init
terraform apply

---
