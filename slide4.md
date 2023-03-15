layout: true
class: compact
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide4

### Configure Terraform Cloud
<font size= 4>

You’ll need to set some environment variables in your Terraform Cloud workspace in order to configure Terraform Cloud to authenticate with AWS using dynamic credentials. You can set these as workspace variables, or if you’d like to share one AWS role across multiple workspaces, you can use a variable set.

#### Required Environment Variables
<font size= 4>

| Variable | Value | Notes |
| -------- | ----- | ----- |
| TFC_AWS_PROVIDER_AUTH1 | true | Must be present and set to true, or Terraform Cloud will not attempt to authenticate to AWS. |
| TFC_AWS_RUN_ROLE_ARN | The arn of the AWS role arn to authenticate against | Optional if TFC_AWS_PLAN_ROLE_ARN and TFC_AWS_APPLY_ROLE_ARN are both provided. |


#### Optional Environment Variables
<font size= 4>
You may need to set these variables, depending on your use case.

| Variable | Value | Notes |
| ---------| ----- | ----- |
| TFC_AWS_WORKLOAD_IDENTITY_AUDIENCE | Will be used as the aud claim for the identity token. Defaults to aws.workload.identity. | |
| TFC_AWS_PLAN_ROLE_ARN | The AWS role arn to use for the plan phase of a run. | Will fall back to the value of TFC_AWS_RUN_ROLE_ARN if not provided. |
| TFC_AWS_APPLY_ROLE_ARN | The AWS role arn to use for the apply phase of a run. | Will fall back to the value of TFC_AWS_RUN_ROLE_ARN if not provided |

<!--
### Configure the AWS Provider
< font size= 4>
Make sure that you’re passing a value for the `region` argument into the provider configuration block or setting the `AWS_REGION` variable in your workspace.

Make sure that you’re not using any of the other arguments or methods mentioned in the [authentication and configuration] (https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)  section of the provider documentation as these settings may interfere with dynamic provider credentials.
 -->
---