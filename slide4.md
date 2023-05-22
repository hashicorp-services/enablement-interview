layout: true
class: img-right
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide4

## Integrate Packer with Terraform (contd.)

#### Create a Packer Template
```json
{
  "variables": {
    "aws_access_key": "{{env `AWS_ACCESS_KEY_ID`}}",
    "aws_secret_key": "{{env `AWS_SECRET_ACCESS_KEY`}}"
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "eu-west-1",
    "source_ami": "ami-844e0bf7",
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",    
    "tags": {
      "OS_Version": "Ubuntu"      
    },    
    "ami_name": "packer-example {{timestamp}}"
  }],
  "provisioners": [{
    "type": "shell",
    "inline": [
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install -y docker.io"
    ]
  }]
}
```

???
* Assign variables
* Define the base image
* Specify the provisioners

A Packer JSON file consists of three main components:

Variables: we can define our custom variables like access credentials, environment names. aws_access_key, aws_secret_key in the above example.
Builders: It is responsible for building the image. It does so by creating a machine(from the base image specified), running the steps provided in provisioners and turning that machine into an image. We can also specify multiple builders for each platform. In the above example,
“amazon-ebs” builder is used to build the AMI images. We can also add other builders for Digital Ocean, Vagrant Box, etc.,

Provisioners: It is used to define steps that need to be executed on top of the base image. We can easily integrate a shell script, ansible-playbook or a chef cookbook for configuring a required application in the AMI. 
In our example, Inline shell commands like sleep, apt-get update, apt-get install -y docker.io is used

---

