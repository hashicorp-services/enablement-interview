layout: true
class: img-right
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide1

## Overview of Packer and Terraform

![scale:50%](./assets/logos/logo_packer_terraform.png)

Developed by HashiCorp, both are IaC tools, but serve different purposes in infrastructure management process.
### Packer
tool for building machine images for multiple cloud platforms like AWS, Azure and Google Cloud.
### Terraform
tool that allows you to define and manage your infrastructure as code, using high-level configuration language.

???
Packer:
- It allows you to automate the process of building custom images that can be used to provision infrastructure, such as virtual machines or containers.
- It works by using a template file to define the desired configuration for the image.
- This includes specifying the base image, the provisioners (which are used to install and configure software on the image), and any additional configuration needed for the specific platform or environment.
- Once the Packer template is defined, you can use Packer to build the image in a repeatable, automated way.
- Packer can output images in a variety of formats, including Amazon Machine Images (AMIs), VirtualBox images, and Docker images.
- Advantages - Speed, Consistency, Automation

Terraform:
- With it, you can define your infrastructure resources as code and manage them as a single unit, regardless of their underlying provider.
- Terraform supports a wide range of cloud providers, such as Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP), and more, as well as on-premises solutions.
- The Terraform configuration language is called HashiCorp Configuration Language (HCL) and is used to define the desired state of the infrastructure resources.
- Terraform works by reading the configuration files and creating a dependency graph of the resources.
- It then creates or modifies the resources in the order required to satisfy the dependencies. This ensures that the infrastructure is created in the desired state and that any changes are made in a safe and predictable way.
---