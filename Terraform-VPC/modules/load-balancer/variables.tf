variable "subnets" {
    description = "Subnets for application load balancer"
    type = list(string)
  
}
variable "sg_id" {
    description = "SG ID for application load balancer"
    type = string
  
}
variable "vpc_id" {
    description = "VPC ID for target group"
    type = string
}

variable "instances" {
    description = "instance id for target group attachment"
    type = list(string)
  
}