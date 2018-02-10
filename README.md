## AWS Cognito User Pool
This repository is to document the current state of how you can create a AWS Cognito User Pool along with the Custom UI with which you can add an Authorizer to secure custom AWS API Gateway API's.

The current state of AWS Cloudformation, API, and CLI support for Cognito is still very immature.  This includes incomplete and inaccurate documenation, along with missing Cloudformation support in general.  

### Setup process
The process with which to create the required AWS resources is a combination of scripted and manual steps.  I will do my best to document these in their current state, as I understand them, at the time of writing this (2/10/2018)


### Disclaimer
Ultimately the best way to setup the required Cognito resources in an automated fashion is to use a higher level configuration tool such as Ansible or  [Terraform](https://www.terraform.io/docs/providers/aws/r/cognito_user_pool.html)

