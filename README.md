# Course Project Part 2
- Name: Jonathan Pham
- Student ID: 934-256-908
- Class: CS 312 System Administration
- Professor: Alexander Ulbrich

## Background: What will we do? How will we do it? 
As seen in the 8.2 Infrastructure As Code lecture, the last slide shows that we need to setup the infrastructure of the Minecraft server using Terraform instead of using the AWS GUI dashboard. And after setting up the infrastructure (EC2 instances) of the Minecraft server, we would need to configure the server to install and run the Minecraft server using Ansible. In order to complete this, I would need to create a Terraform script that sets up a valid EC2 server instance and then create a Ansible playbook script that configures the server I just created. 

## Requirements:
- What will the user need to configure to run the pipeline and what tools should be installed?

The user will need to configure their Terraform and Ansible scripts to run the pipeline. The tools required for are: Terraform v1.8.5 (for provisioning), Ansible v2.16.6 (for configuration), and the AWS CLI (for key pair creation). 

- Are there any credentials or CLI required?

Yes, the first is the AWS CLI credential in order for my local terminal to connect to AWS services, especially when using Terraform. This will be accessed through the Learner Lab module to get the credentials. The next credential is used for SSH key pair creation. In order for me to create an SSH key pair through AWS CLI, I would enter this command (ChatGPT): `aws ec2 create-key-pair --key-name mc_kp --query 'KeyMaterial' --output text --region us-west-2 > ~/Code/cs312/Project-Part-2/mc_kp.pem`

- Should the user set environment variables or configure anything?

The only environment variables that the user should configure is to set the AWS CLI credentials that was copied in the Learner Lab module to `~/.aws/credentials`. (Note: Every time you start a new lab session, the credentials change)

## Diagram of the major steps in the pipeline. 


    
## List of commands to run, with explanations.
    
## How to connect to the Minecraft server once it's running?


## Sources:

https://cloud-images.ubuntu.com/locator/ec2/
https://spacelift.io/blog/terraform-output
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair



Scripts to run: 

aws ec2 create-key-pair --key-name mc_kp --query 'KeyMaterial' --output text --region us-west-2 > ~/Code/cs312/Project-Part-2/mc_kp.pem

chmod 400 ~/Code/cs312/Project-Part-2/mc_kp.pem

ansible-playbook -i inventory/hosts playbook.yml



