Using HCP Packer with Terraform Cloud

Hi everyone, welcome to another week of the series. Today we will be covering HCP Packer. With that, let's get started.

Unified Workflow with Terraform Cloud

Creating a Golden Image

2

Agenda

Packer OSS & HCP Packer Overview 

02

03

01

Go through the agenda to start off the webinar 

3

Packer OSS & HCP Packer Overview

01

Let’s jump into an overview of Packer OSS and HCP Packer

Images as Code

4

Customization

Private DC 

Cloud

The standard for infrastructure automation to build, govern and manage any image for any cloud

Ansible

Bash

Powershell

AWS

Azure

GCP

VMware

VirtualBox

Vagrant 

Before we dive into HCP Packer, let’s look at what Packer is itself 

HashiCorp Packer is the standard for infrastructure automation helping to build, govern and manage any image for any cloud

It is an open source tool that enables you to create identical machine images for multiple platforms from a single source template

We like to refer to these identical machine images as “golden images”  

Packer supports integrations with the technologies you are already using, 

Customization tools help you build and embed security and compliance requirements into your images, 

And manage the deployment of them whether its on prem in your private DC or in the cloud with all major providers

5

What is HCP Packer?

Codification = Standardization and Automation

So now what does HCP Packer do?

HCP Packer is a registry that stores the metadata about your Packer images so you can track updates, use the most up-to-date base images, and deploy the most up-to-date downstream images 

Notice I said it stores the metadata of your image, not the image itself 

You will continue to store your images in cloud platforms or other services, however HCP Packer helps you track information about your machine images, clearly designate which images are appropriate for test and production environments, and query the right images to use in both Packer and Terraform configurations 

Create/build your image with all the specific requirements your organization needs to meet

Maintains the image by making updates when necessary 

Store the metadata of your image after being built with Packer

Quickly deploy identical machine images for multiple platforms from a single source template

6

Let’s discuss the difference between the two now.

Packer:

With Packer, you create or build your image 

You set the security and compliance rules and the specifications of the image you want to deploy 

Packer is also where you maintain your images 

Since we said that HCP Packer just stores the metadata of your image, if you need to make changes to the images specifications, you would do so with Packer 

As an analogy, we can say Packer is like a photographer taking a photo 

They are the ones that knew what to take a picture of, how to set up the scenery, and basic rules of photography

They capture one photo but cannot recreate the image exactly ever again

HCP Packer:

Now, with HCP Packer since we are only storing the metadata of the image, we don’t know all the specifications of the image 

When we say the metadata, we mean things like when the image was created, the associated cloud provider, and if there is a Git commit associated with your image

This allows you to quickly reference your golden image and rapidly deploy identical images across multiple platforms

We could say this is like making multiple copies of the image a photographer took using a printer then distributing them out to multiple different people

The printer itself doesn’t know everything about where the image was taken, how to take the photo, or stage the photo

All the printer knows is it has an image it needs to print and who is telling it to print the image 

Using a printer allows you to print multiple copies of an image rather than recreating it over and over

HCP Packer Workflow

7

Let’s take a look at the general workflow people use when adopting HCP Packer

You’ll start with your Packer file 

The idea of this file is to codify all the inputs to create a production worthy artifact image 

This file may include source code, configuration management, or we could be baking in security and compliance controls 

Then this file gets fed into Packer where it can execute the codified definition to create multiple output images 

These output images may be Amazon AMIs, VMware images, or Azure images 

So, Packer is capable of creating multiple different machine images 

Now here is where a challenge will arise; how can we manage all these images 

With HCP Packer, we can manage the metadata of each image 

Each of these images gets published to the registry with a unique image ID

These images can have multiple versions in which Packer keeps track of 

Then with all our images stored in the registry, we can query it via API to find a specific version of a certain image and use it in downstream systems like Terraform 

8

Organizations Must Still Define:

v

v

v

Which are the “golden” images, and what version should they use?

What is the ideal workflow to ensure images are hardened, secure, and compliant and can be replicated across clouds and private data centers? 

Can this process be integrated into our current provisioning workflows?

There are decisions that your organization needs to make if you are already using Packer

You need to decide what are the golden images and what versions should they use 

Different teams and different people may have different iterations of a specific image that they want to use 

You need to define what the ideal workflow is to ensured images are hardened, secure, and compliant 

One way people often do this is managing the ideal image through a spreadsheet, which is not ideal 

You also need to determine how this process can be replicated across clouds and what is our workflow for managing these images

Next you should ask can this process be integrated into current provisioning workflows 

Ideally you aren't using all different tools

You want to work with the infrastructure you have and you want to have a consistent provisioning workflow 

HCP Packer is a multi-cloud image registry 

It uses metadata from your existing images to track iterations 

Builds artifacts across downstream builds and provisioning pipelines 

It forms the foundation of a multi-cloud golden image pipeline

9

Golden Image Pipeline 

It is important to note that HCP Packer is not “Packer in the cloud.” 

It is a multi-cloud registry that tracks images across clouds, and makes them available as a data source both to downstream images and Terraform provisioning pipelines

Like I said earlier, this registry stores the metadata of your images (not the image itself) and allows people across your organization to have access to them 

Which then forms the foundation or a multi-cloud golden image pipeline 

Gain visibility into a base image’s downstream builds and associated provisioning pipelines

Automate updates by triggering a build or an apply

Create a compliant workflow for images across all of your infrastructure

10

Standardizing the Workflow 

Write a golden image once, and reuse it across downstream builds and provisioning pipelines

Bridging the Gap Between Image Factories and Image Deployments 

The golden image factory is all about standardization!

You want to be able to bake in all the security and operational requirements into an image that can then be socialized around your company 

Creating that golden image provides visibility into its downstream builds, allows you to automate updates with a build or apply, and creates a compliant workflow across all your infrastructure

In these code blocks, you can see that Terraform is calling the Packer image by its bucket name and channel 

Channels allow you to label image iterations to describe the quality and stability of the build 

So, whenever you use the bucket name associated with that channel, it will provide you with the most up-to-date version of that image

We will dive deeper into the integration with Terraform later

The Shift to HCP Packer

Easy to read and write: Leverages HCL2, making it easier to use alongside Terraform

Extensible: Use one language to manage images across clouds and integrate with other configuration tools 

Open source: Use existing community templates, or write your own 

11

Updating images is often a siloed and manual process, particularly across different cloud providers 

There are often multiple teams with multiple processes, which leads to lots of redundant work - making visibility and security difficult 

Packer Provides One Workflow for Managing Images Across Clouds

This is one of Packers “superpowers” - being able to create one template and use it across multiple platforms 

Writing your image template is easy with HCL2 - HCL2 is HashiCorps very human-readable coding language 

Using it allows you to manage images across clouds in one language 

Not to mention, there are lots of templates readily available online

Automated Machine Images 

Golden Image Pipeline

Image Governance & Compliance 

Unified Workflow with Terraform 

12

Use Cases

These are some of the most common use cases we tend to see with Packer 

The first being Automated Machine Images 

You have the ability to automate the creation of any type of machine image 

And even further you can customize images to match application and organizational requirements 

Second, creating that Golden Image Pipeline

Here we can integrate image management with provisioning workflows to automate updates across downstream builds 

Third, Image Governance and Compliance 

Organizations want to create one security and compliance workflow for images that are provisioned across multiple clouds 

And lastly, a unified workflow with terraform 

You will have the ability to create multi-cloud golden image pipelines with HCP Packer and Terraform Cloud 

13

Feature:

Release Management

Image channels assign iterations to human-readable names that consumers can reference in Packer templates or Terraform configurations 

Standardize versions by declaring a preferred iteration of an image

Empower other teams to retrieve the latest image version from their desired channel without changing their configurations

Now let’s get into some more specific features of HCP Packer

Channels are what allow us to assign iterations to each image that can then be easily reference in Packer templates and Terraform configurations

The iterations can have human-readable names such secure-channel, prod-channel, etc.

Creating these channels helps your team retrieve the latest image version 

You can tell Terraform which channel you want to use and whichever iteration is up-to-date and active in your HCP Packer registry will be used

One of the newest features that was released for HCP Packer was channel assignment history 

This gives you more visibility into the lifecycle of your images 

Previously there was no way of seeing which images version was assigned to a channel at a particular point in time

But now with channel assignment history, you can see up to a year (with the Plus tier) of assignment history for every channel 

Another feature that was just released is restricted channels 

Teams often collaborate with cross-functional stakeholders to validate internal requirements are met prior to releasing it downstream to consumers 

For example, a security team has to sign off on artifacts before they are widely distributed

Now with restricted channels, artifact owners can restrict channels to other collaborators and system administrators 

This includes the default “latest” channel 

14

Feature:

Image Compliance Checks

Ensure images are compliant by integrating HCP Packer with Terraform Cloud using run tasks

Reduce risks by scanning all Terraform configurations for revoked images

HCP Packer integrates with TFCB using run tasks

So if you try to execute a terraform plan for a configuration that includes a revoked image, Terraform will let you know 

This feature helps reduce risks by checking if any of the images have been revoked 

15

Advantages of Packer 

1

2

3

4

Rapid infrastructure deployment

Multi-provider portability

Improved stability

Greater testability

Advantages of HCP Packer 

Visibility

Governance & Controls

Unified Workflows 

 

1

2

3

So why would an organization want to use Packer or HCP Packer? What will it benefit them?

To start with Packer OSS, you get super fast infrastructure deployment

Packer images allow you to launch completely provisioned and configured machines in seconds, rather than several minutes or hours

This benefits not only production but development as well!

You also have multi-provider portability

Because Packer creates identical images for multiple platforms, you can run production in AWS, staging/QA in a private cloud like OpenStack, and development in desktop virtualization solutions such as VMware or VirtualBox.

Additionally, you get improved stability

Packer installs and configures all the software for a machine at the time the image is built

If there are bugs in these scripts, they’ll be caught early, rather than several minutes after a machine is launched

And lastly, greater testability

After a machine image is built, that machine image can be quickly launched and smoke tested to verify that things appear to be working

If they are, you can be confident that any other machines launched from that image will function properly

In regards to HCP Packer, one advantage is having visibility of all your images

The HCP Packer registry gives you an overview of all the images you have available 

And we already discussed the new channel assignment history feature that allows you to see which image version was assigned at a certain point in time 

 Another advantage is governance and controls 

With features like channel assignment history, restricted channels, and image revocation, you can keep you images secure and in the right hands 

Lastly, unified workflows with Terraform 

You can integrate HCP Packer with Terraform to deploy your images 

We will discuss this integration in more detail later 

16

Creating a Golden Image

02

Now we’re going to look into how to actually create your Golden image and put it to use 

17

packer {

  required\_plugins {

    ... 

  }

}

source "\<BUILDER\_TYPE>" "\<UNIQUE\_NAME>" {

  ... 

}

build {

  ... 

}

Packer Templates

The packer {} block contains Packer settings, including specifying a required Packer version

The source block configures a specific builder plugin, which is then invoked by a build block

The build block defines what Packer should do with the image after it launches

The following code block is an example of a Packer template 

A Packer template is a configuration file that defines the image you want to build and how to build it 

These templates use HCL, or HashiCorp Configuration Language

There are key components you need to consider when creating a template 

The first being the “packer” block 

This block contains Packer settings such as a required Packer version 

Inside this block you will find the required\_plugins block which specifies all the plugins required by the template to build your image 

Packer is packaged into a single binary, but it depends on plugins for much of its functionality

There are plugins that have been built and maintained by HashiCorp, but you also have the option of writing and using your own plugins 

However, the source attribute is only necessary when requiring a plugin outside the HashiCorp domain 

Moving down to the source block

This block configures a specific builder plugin, which is then invoked by the build block 

Source blocks use builders and communicators to define what kind of virtualization to use, how to launch the image you want to provision, and how to connect to it 

A source can be reused across multiple builds and you can use multiple sources in a single build 

The source block has two important labels: a builder type and a unique identifier

These labels help us reference the sources later when we define build runs

Lastly, the build block 

The build block defines what Packer should do with the image after it launches 

You can specify the name you want to give the image which will appear in your registry 

18

Packer Templates

Build an Image 

packer {

  required\_plugins {

    amazon = {

      version = ">= 0.0.2"

      source  = "github.com/hashicorp/amazon"

    }

  }

}

source "amazon-ebs" "ubuntu" {

  ami\_name      = "learn-packer-linux-aws"

  instance\_type = "t2.micro"

  region        = "us-west-2"

  source\_ami\_filter {

    filters = {

      name                = "ubuntu/images/\*ubuntu-xenial-16.04-amd64-server-\*"

      root-device-type    = "ebs"

      virtualization-type = "hvm"

    }

    most\_recent = true

    owners      = \["099720109477"]

  }

  ssh\_username = "ubuntu"

}

build {

  name    = "learn-packer"

  sources = \[

    "source.amazon-ebs.ubuntu"

  ]

}

\*\* IMAGE CREATION \*\* 

Here’s a more indepth example of a Packer template

With this specific template, we will build a t2.micro Amazon EC2 AMI

You can see that we have added the amazon provider and version we want to use into the packer block 

Within the source block, we have specified an amazon-ebs builder type with the unique identifier of “ubuntu”

The amazon-ebs builder launches the source AMI, runs provisioners within this instance, then repackages it into an EBS-backed AMI

You can also see within this block is where we specified all the settings for the instance we want to build 

We are launching a t2.micro instance in the us-west-2 region using an ubuntu:xenial AMI as the base image, and naming it “learn-packer-linux-aws” 

This example also uses the SSH communicator by specifying the ssh\_username attribute 

This allows you to SSH into the EC2 instance using a temporary key pair and security group to provision your instances 

Now, the build block is going to create the AMI with all the specifications provided 

We name the image learn-packer; this is what will show up in your HCP Packer registry 

We also tell it that we want to use the amazon-ebs source when executing our build 

The link provided on this page will take you through a step by step process for building this exact image

19

Build a Golden Image

$ packer build aws-ubuntu.pkr.hcl

learn-packer.amazon-ebs.ubuntu: output will be in this color.

\==> learn-packer.amazon-ebs.ubuntu: Prevalidating any provided VPC information

\==> learn-packer.amazon-ebs.ubuntu: Prevalidating AMI Name: learn-packer-linux-aws

   learn-packer.amazon-ebs.ubuntu: Found Image ID: ami-0dd273d94ed0540c0

\==> learn-packer.amazon-ebs.ubuntu: Creating temporary keypair: packer\_608a6435-e0b2-c633-95f0-bf168f01e891

\==> learn-packer.amazon-ebs.ubuntu: Creating temporary security group for this instance: packer\_608a6437-6b48-288e-6d5e-c085366a5541

\==> learn-packer.amazon-ebs.ubuntu: Authorizing access to port 22 from \[0.0.0.0/0] in the temporary security groups...

... 

\==> Wait completed after 5 minutes 19 seconds 

\==> Builds finished. The artifacts of the successful builds are: 

\--> learn-packer.amazon-ebs.ubuntu: AMIs were created:

us-east-2: ami-0d9356dfdbea0d50b

\--> learn-packer.amazon-ebs.ubuntu: Published metadata to HCP Packer registry

packer/learn-packer/iterations/01FFJD3GDKRBW4CZ314EZ467VY

Once you have created your golden image and are ready to build it, you would run the following command 

The output is as follows and you will be able to see the image in your cloud provider account (in this case it’s AWS) 

However, executing a packer build just builds the image, it does not manage it at all 

It then becomes your responsibility to deploy or destroy as you see fit 

You can see at the bottom of this terminal output, the AMI was successfully created and published to the HCP Packer registry 

20

Golden Image Pipeline

Golden Image: an image on top of which developers can build applications, letting them focus on the application itself instead of system dependencies and patches 

Now let’s talk about what exactly is a golden image 

A golden image is an image on top of which developers can build applications, letting them focus on the application itself instead of system dependencies and patches

This provides two major benefits: 

(1) for developers, they won’t need to worry about securing patches or configuring things like logging and monitoring agents; they can focus on just writing the application 

(2) for the operations and security teams, they know that any application built on top of the golden image are secure and can be easily monitored; traditionally these teams are the ones that handle the creation and circulation of images to developers 

DevOps teams can trigger updates across downstream builds and provisioning pipelines by codifying golden images 

This team also needs to generate new machine images for multiple platforms and verify the functionality of changes 

The HCP Packer registry improves this process by automatically tracking image metadata and storage location and automatically providing the correct image to developers through Packer and Terraform integrations, which we will talk about in more detail later

21

Updating your Golden Image

Ubuntu 20.04

Ubuntu 20.04.3

After creating a golden image, you can easily update it and have it update across downstream builds

Packer allows you to update a specific image, and it will automatically update wherever it is used

Here we can see we had Ubuntu 20.04 but we updated it to a newer version of 20.04.3 

This image has been used across three different projects 

The image will stay up to date within all these projects

22

Golden Image Ancestry

Ancestry tracking is one of the newest features of HCP Packer that provides visibility into image dependencies across your cloud environment for image lifecycle management

A typical approach to image management is to first build a set of common base or “golden” images for a given operating environment

These base images can be thought of as a “parent” 

Then we can build “child” images from these base images to meet specific application needs 

Tracking the relationship between parent and child images can be difficult and often involves manual processes 

This leads to unclear parent-child dependencies and inconsistent statuses when remediating security or configuration issues in base images 

Child images could be left referencing out-of-date parent images without manual tracking and intervention 

Here you can see how we can keep track of our images in the HCP Packer registry 

You can see the status of each image and if they have a child image associated with it

For the ubuntu base image, you can see that there are three child images based off the parent image and one of them is out of date 

With this feature, you can ensure that your child images are never referencing out-of-date parent images 

23

Manage the Lifecycle of a Packer Image

Create multiple versions of the same image 

Scheduling a revocation of an image 

Release new image versions

Use channel rollback 

Once you’ve built your image, there are still things you need to keep in mind while the machine image is active 

Instead of completely getting rid of an image then building a new one, you can create multiple versions of the same image

This allows you to make minor or major changes to an image configuration, all while keeping track of each iteration in your HCP Packer registry 

You can update these images and release new versions of them

You can keep track of all these versions and where they were used in the HCP Packer registry 

If an image has become outdated or violates security protocols, you can schedule a revocation of an image 

You can do so at a specific date and time on a particular version of an image with the plus tier 

But you can still revoke images with the standard tier, you just can’t schedule it 

When going between different versions of an image, you can use channel roll back 

Channel rollback is also a new feature that allows you to automatically go back to the previous iteration of an image if the current one is outdated or unavailable 

Using channel rollback ensures there is still an image available to use downstream without slowing down the process 

24

Best Practices

Variables 

Provide the type in your variable definition 

If no type is set, Packer assumes it will be of type string 

Set a default value so you don’t have to at run time

Do NOT save sensitive information to a VCS 

variable “weekday” {} 

variable “sudo\_password” {

type      = string 

default   = “mypassword”

sensitive = true 

}

variable “flavor” {

type    = string 

default = “strawberry” 

}

variable “exit\_codes” {

type    = list(number) 

default = \[0]

}

locals {

ice\_cream\_flavor = “${var.flavor}-ice-cream”

foo              = “bar”

}

ANIMATION: Red boxes appear on each variable when talked about

Now let’s talk about some best practices you should follow when writing your first Packer template 

First off is variables 

Similar to Terraform, you can have a designated file for variables → we would name it variables.pkr.hcl (however you can choose any name)

When defining your variables, it is highly recommended to provide the type in your definition 

You can see here that the variables (\*\* CLICK FOR ANIMATION – BOXES APPEAR \*\*) “sudo-password”, “flavor”, and “exit\_codes” all have types defined 

If you do not provide the variable type, like how “weekday” is defined (\*\* CLICK FOR ANIMATION – BOXES APPEAR \*\*), Packer will assume the type will be a string 

It is also best practice to set a default value for each variable defined 

If you set a default value, you don’t have to set the variable at run time with the -var flag 

However, even if you still have a default value but choose to provide it via command-line, the command-line input takes precedence over the default value

If you do not set a default value or provide a value through the CLI, Packer will fail immediately when you try to run a build 

Providing a default value vs. leaving the block empty (like the “weekday” variable) helps the HCL parser understand what is being set 

Otherwise, it will interpret all of your command line variables as strings 

Lastly, do NOT save sensitive information to version control 

By this I mean do not hard code any of your service principal requirements 

However, you can create a local secrets variables file and use the -var-file to load it 

25

Best Practices

Bucket Labels & Build Labels

Bucket labels help identify characteristics common to a set of images 

HCP Packer applies custom bucket labels to an entire image bucket 

Build labels are a immutable set of labels based on the Packer template at the time of build

“bucket-labels”: {

“team” = “amazon-development”,

“os”   = “Ubuntu”

} 

build\_labels = {

      "build-time"   = timestamp(),

      "build-source" = basename(path.cwd)

    }

Another thing to consider when creating your Packer template is to include bucket labels 

Bucket labels help you identify characteristics common to a set of images 

Image buckets are repositories that store information about each artifact from a configured Packer template 

In this example, we created a bucket label for the team and the operating system used for this image 

You should also practice using build labels 

These are immutable sets of labels based on the packer template at the time of the build 

These build labels are show on a specific iteration of your image in your HCP Packer registry vs. how buket labels are shown in the overview of the image details 

26

Best Practices

Parallel Builds 

Create a source 

Add the source to the sources array in the build block 

source “docker” “ubuntu” {

image  = “ubuntu:xenial”

commit = true

}

source “docker” “ubuntu-bionic” {

image  = “ubuntu:bionic”

commit = true 

}

build {

name    = “learn-packer”

sources = \[

“sources.docker.ubuntu”,

“sources.docker.ubuntu-bionic”

]

}

ANIMATION: Boxes appear when talked about 

Packer allows you to do parallel builds which means you can create multiple images all configured from a single template 

To best use parallel builds, you should first create your sources (\*\* CLICK TWICE FOR ANIMATION – BOXES APPEAR \*\*)

These sources do not need to be the same type 

Then once you have all your sources defined, add them to the sources array (\*\* CLICK FOR ANIMATION – BOXES APPEAR \*\*) in the build block 

In this example, we are building two docker images in parallel 

However, you could build an Amazon AMI and a VMware virtual machine in parallel with the same scripts, resulting in near-identical images 

Once you run a packer build, you will see two different color outputs; one for each image being built 

27

Unified Workflow with Terraform Cloud

03

Now let’s dive a little deeper into the unified workflow with Terraform Cloud 

28

HCP Packer

Build images

Publish metadata

Release via channels

Revoke and rollback

View ancestry & history

Terraform Cloud

Fetch images

Data source

Provision infrastructure

Validate image status

Run tasks, continuous validation

Better together

Terraform Cloud + HCP Packer

Terraform Cloud and HCP Packer is a great “better together” story 

It’s the perfect extension for customers who are already using Terraform

We can ask them “hey how are you building your images?”

Well, you can build these images with Packer OSS then publish the metadata of these images to the Packer Registry 

Then you can promote or assign these images for different environments via channels 

And this is how our downstream consumers know which image to consume 

In the mix of things, we are doing revocation and roll back when necessary 

And now we have this new view into ancestry and channel assignment history of images as well 

So we get the whole image lifecycle with Packer and HCP Packer 

Moving into the unified workflow with Terraform

We will fetch these images using the data source in the HCP provider that will be querying the channels to get the correct image ID 

We will be provisioning infrastructure based on these images 

Terraform Cloud and HCP Packer integrate through run tasks and continuous validation to make sure we are provisioning the right image and not revoked images 

There is also the possibility of images being updated on the HCP Packer side → we can now (through continuous validation) validate the image used in your infrastructure against the images stored in the HCP Packer registry to make sure it was not revoked or is the most current version available

Integrated build & provisioning workflow

29

Terraform Cloud + HCP Packer

This diagram gives a general end-to-end workflow of the integration between Terraform Cloud and HCP Packer 

We are building and defining images with Packer (very left - APPLICATION AND GOLDEN boxes) 

Then we publish the metadata of that image to the registry and then actual image gets published to whatever our clouds image repository is (i.e., AMI in AWS)

Then we query the registry using Terraform through the data source

Terraform deploys instances 

And we have the run task validation step that can prevent infrastructure going out with the wrong image version or revoked images 

And we end up with our compute instances

HCP Packer has a Plus tier available from which larger teams will benefit from 

The plus tier provides advanced image compliance checks using the Terraform Cloud image validation run task 

It will validate whether your Terraform configuration references revoked images, which helps improve your security and compliance standards 

The run task will perform two types of validation: 

(1) data source image validation; meaning the run task scans planned resources that reference image artifacts through the HCP Packer data source 

(2) resource image validation; meaning the run task scans planned resources that use hard-coded machine image IDs

30

Automate Image Updates

As mentioned before, we want to bridge the gap between image factories and image deployment 

Codifying images standardizes practices within an organization - ensuring all compliance rules are met

When integrating with Terraform, you can query the correct image based on channel assignments rather than hard-coding 

Now we’ve enabled an immutable infrastructure workflow by having the ability to re-deploy infrastructure using the latest images 

  

Automating image updates is simple with the HCP Packer and Terraform unified workflow 

Once a new iteration is created, it’ll be assigned to the latest channel 

Keep in mind the restricted channels feature we discussed earlier 

The latest channel is now restricted by default since it is automatically created during your packer build 

However, this iteration will automatically be updated for downstream consumers such as Terraform 

Image Lifecycle Management

Build artifact from Packer template

Track image in the HCP Packer registry 

Provision Infrastructure with image

Keep up with security & compliance rules 

Revoke an image 

Revise an image (versioning)

31

Assign image to channel

Packer itself does not manage your images, it simply builds them and allows you to maintain them

Once you’ve built your images it is your responsibility to launch or destroy them as you see fit

You can do so with the help of Terraform 

To build an image and maintain it, you will go through this lifecycle process 

You have to start by building your golden image template with Packer and then upload it to the HCP Packer registry 

It is in this registry where you can keep track of all your images 

Then you assign that image to a specific channel so it can be referenced in Packer templates or Terraform configuration 

Once you have stored the metadata of your images in HCP Packer, you can deploy it with Terraform using run tasks 

After deploying your image, you need to make sure that it stays secure and compliant as your company evolves 

If your image becomes outdated, you can revoke that image and update it by creating a new version 

After creating your new version, the cycle repeats 

Image Revocation 

32

Let’s dive a little deeper into the revocation process

When your image expires, it is important to revoke it

Outdated images may become a major security risk, so revoking it prevents consumers from accessing its metadata and using it to build an artifact 

There are a few ways of going about revoking an image 

You can do an immediate revocation and it would look like the image on the left 

As the name suggests, this immediately revokes your image 

Like I mentioned before, you can now add channel rollback to automatically assign the previous version after the revocation

This provides a simpler remediation process with one-click access to assign a previous iteration 

This workflow is especially useful when revoking a currently published iteration while reducing the remediation time during a security incident 

Immediate revocation can be done with the free and standard versions of HCP Packer 

You can also schedule a revocation as shown in the image on the right 

However, this is a PLUS tier feature

It allows you set a Time to Live (TTL) on images 

Meaning you can set a specific date and time for the image to be revoked 

Scheduling a revocation prevents consumers from using outdated images and strengthens your compliance posture

A common use case is scheduling revocation at publishing time for organizations that require image TTLs 

33

Resources

Intro to HCP Packer

Mutable vs. Immutable Infrastructure

Packer with AWS

Getting Started with HCP Packer

Fundamentals of HCP Packer

Terraform Cloud Run Tasks for HCP Packer

Channel Assignment History and Automated Rollback

Here are some good resources to look over when starting with HCP Packer 

customer.success\@hashicorp.com

www\.hashicorp.com/customer-success

Once released include a slide around the updates to Terraform Provider that enables automagic release management via the Provider

35
