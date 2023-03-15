layout: true
class: compact
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide5

---
### Configure Dynamic Credentials
<font size=4>

Using dynamic credentials in a workspace requires the following steps for each cloud platform:

1. **Set up a Trust Relationship**: You must configure a relationship between Terraform Cloud and the AWS cloud platform. 
2. **Configure Cloud Platform Access**: You must configure roles and policies for the cloud platform to define the workspace’s access to infrastructure resources.
3. **Configure Terraform Cloud Workspace**: You must add specific environment variables to your workspace to tell Terraform Cloud how to authenticate to the other cloud platform during plans and applies.

- [Amazon Web Services](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/aws-configuration)

---

