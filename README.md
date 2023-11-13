## Terraform Basics

* The terraform.tfstate file allows you to manage resources provisioned via terraform
* Desired state is your configuration files (theoretical resources)
* Current state refers to the resources that have been provisioned
* Validation ensures that resources must follow conditions to be made

### Terraform Modules

* Packages of Terraform configuration managed as a group
* e.g. VPC module pack is able to configure all contents related to VPC (subnets, IP, DNS, Gateways etc)

### Terraform Version Constraints
* Locked in versions for when you're using Terraform modules
* Version constraints are only applicable to modules grabbed from registry's (terraform registry)
* A module version is just the version of the module (newer versions have more resources which the module can create)
### Data Source

* data resources are associated with a *single data source*
* A data source can be an AMI with its resource components being the content of the AMI (device-type,virtualisaiton-type)

### Networking Advice

* The amount of IP address' within a CIDR notation (e.g. '/32') is calculated by...
  * Calculating the amount of '0' bits present within the 32 binary notation
  * /27 would be 11111111.11111111.11111111.11100000 
  * The last few bits is then calculated as 2^5 == 32
  * If it was 10.0.0.0/27 it can go from 10.0.0.1 --> 10.0.0.30
  * This is because the first and last IPs are reserved
  * In AWS, the first four IP address' and last IP address are reserved by AWS
  * That means it would be 10.0.0.5 --> 10.0.0.30


* Public Route Table:
  * This will associate with the public subnet
  * It routes all traffic to the IGW
  * Ensures all resources created within the pub-sub are directed to the public internet

* Private Route Table:
  * This will associate with the private subnet
  * It routes all traffic to the NAT GW
  * Ensures all resoures created within the pub-sub access public internet through NAT GW (outbound traffic ≠ inbound)