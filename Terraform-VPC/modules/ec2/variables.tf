variable "sg_id" {
    description = "SG Id for ec2"
    type = string
  
}

variable "subnets" {
    description = "Subnets for Ec2"
    type = list(string)
  
}

variable "ec2_names" {
    description = "Ec2 Names"
    type = list(string)
    default = [ "WebServer1", "WebServer2" ]
  
}