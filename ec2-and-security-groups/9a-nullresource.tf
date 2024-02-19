resource "null_resource" "name" {
    depends_on = [module.ec2_public] # if null resource is created before ec2 instance how will the public connection be made?
    
    connection {
    type     = "ssh"
    host     = aws_eip.bastion_eip.public_ip # grabbing the public ip of the bastion host ec2
    user     = "root"
    password = ""
    private_key = file("./Akira_AWS_Key.pem")
  }
  # provisioner file moves file from machine running terraform to newly created resources 
    provisioner "file" {
    source      = "./Akira_AWS_Key.pem"
    destination = "/tmp/Akira_AWS_Key.pem"
  }
  # using remote-exec provisioner to fix pvt key perms
    provisioner "remote-exec" {
    inline = [
      "chmod 400 /tmp/Akira_AWS_Key.pem"
    ]
  } 
  ## Local Exec Provisioner: (triggered during create resource)
    provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }
  ## triggered during deletion of resources (prov = provisioners)
  provisioner "local-exec" {  
    command = "echo destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
  }
}
    


# Creation Time Provisioners - By default they're created during resource creations (terraform - apply)
# Destroy Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)