layout: true
class: img-right
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide2

## Integrate Packer with Terraform

![scale:50%](./assets/logos/logo_packer_ami_terraform.png)

### Steps:

- Create a Packer template



- Build the image




- Reference the image in Terraform

???
The goal here is to:
- Create a JSON template file to describe the configuration needed to build the Packer image
- Build the image using that template. We will get an AMI ID for the image that we can reference in terraform
- Reference our image in the terraform configuration file, and provision an EC2 instance with it

---

