### Terraform SGs

* Creating bastion hosts and the SG's configured with it
* Bastion host provides secure access for private networks so they can access a public network
* ssh-tcp and http-tcp is because the protocol is marked as tcp


* naming conventions for outputs and their modules are as follows:
  * module name = ec2_public
  * calling the module in an output would be module.ec2_public.<output_name>

* Terraform meta argument count
  * Indexing the resource being created is only necessary if there are multiple instances being created...
  * instance = module.ec2_public_id[0]
    * The above module is making several instances, the above index count would signify the first instance only