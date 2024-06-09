# Course Project Part 2
- Name: Jonathan Pham
- Student ID: 934-256-908
- Class: CS 312 System Administration
- Professor: Alexander Ulbrich

## Background: What will we do? How will we do it? 
   
## Requirements:
    - What will the user need to configure to run the pipeline?
    - What tools should be installed?
    - Are there any credentials or CLI required?
    - Should the user set environment variables or configure anything?

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



