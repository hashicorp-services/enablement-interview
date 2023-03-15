layout: true
class: col-2
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide3

### Configure AWS
<font size= 4>
1. Create an OIDC identity provider in your AWS account.
2. Create a role and trust policy that specifies the OIDC provider as the principal and the role that will be assumed.
3. Attach the role to your EC2 instance profile or task IAM role.


#### Code
<font size= 4>

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "OIDC_PROVIDER_ARN"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "SITE_ADDRESS:aud": "AUDIENCE_VALUE",
                    "SITE_ADDRESS:sub": "organization:ORG_NAME:project:PROJECT_NAME:workspace:WORKSPACE_NAME:run_phase:RUN_PHASE"
                }
            }
        }
    ]
}
```

<!-- Please replace the folowing Capitilized values
- **OIDC_PROVIDER_ARN**: The ARN from the OIDC provider resource created in the previous step
- **SITE_ADDRESS**: The address of Terraform Cloud with https:// stripped, (e.g., app.terraform.io)
- **AUDIENCE_VALUE**: This should be set to aws.workload.identity unless a non-default audience has been specified in TFC
- **ORG_NAME**: The organization name this policy will apply to, such as my-org-name
- **PROJECT_NAME**: The project name that this policy will apply to, such as my-project-name
- **WORKSPACE_NAME**: The workspace name this policy will apply to, such as my-workspace-name
- **RUN_PHASE**: The run phase this policy will apply to, currently one of plan or apply.
 -->
---

### Configure a Role and Trust Policy
<font size =4>
You must configure a role and corresponding trust policy. Amazon documentation on setting this up can be found here: Creating a role for web identity or OpenID Connect Federation (console) - AWS Identity and Access Management. The trust policy will be of the form:

```{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "*"
        }
    ]
}

```



<!-- Warning: you should always check, at minimum, the audience and the name of the organization in order to prevent unauthorized access from other Terraform Cloud organizations!
AWS documentation for setting this up through the AWS console or API can be found here: Creating OpenID Connect (OIDC) identity providers - AWS Identity and Access Management.
-->
---

