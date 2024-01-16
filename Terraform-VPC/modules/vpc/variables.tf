variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
}

variable "subnet_cidr" {
    description = "Subnet CIDRS"
    type = list(string)
}
variable "subnets_names" {
    description = "Subnet Names"
    type = list(string)
    default = [ "PublicSubnet1", "PublicSubnet2" ]
  
}