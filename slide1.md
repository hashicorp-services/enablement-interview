layout: true
class: compact
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide1

### How Dynamic Credentials Work

##### The following process occurs for each Terraform plan and apply:
<font size =4>

1. Terraform Cloud generates a [workload identity token](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/workload-identity-tokens).

2. Terraform Cloud sends the workload identity token to the cloud platform

3. Verification of the workload identity token.

4. Temporary credentials for Terraform Cloud is generated.

5. Terraform Cloud sets up these credentials within the run environment.

6. The Terraform plan or apply proceeds.

7. When the plan or apply completes, the run environment and temporary credentials is torn down.


<!-- You configure a trust relationship between your cloud platform and Terraform Cloud. As part of that process, you can define rules that let Terraform Cloud workspaces and runs access specific resources. 
1. Terraform Cloud generates a [workload identity token](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/workload-identity-tokens). The token is compliant with OIDC standards and includes information about the organization, workspace, and run stage.
2. When a plan or apply begins, Terraform Cloud sends the workload identity token to the cloud platform, along with any other information needed to authenticate.
3. The cloud platform uses Terraform Cloud’s public signing key to verify the workload identity token.
4. If verification succeeds, the cloud platform returns a set of fresh temporary credentials for Terraform Cloud to use.
5. Terraform Cloud sets up these credentials within the run environment for the Terraform provider to use.
6. The Terraform plan or apply proceeds.
7. When the plan or apply completes, the run environment is torn down and the temporary credentials are discarded -->
