resource "aws_security_group" "sg" {
    name = "sg"
    description = "Allow HTTP, SSH inbound traffic"
    vpc_id = aws_vpc.my_vpc.id
  
}