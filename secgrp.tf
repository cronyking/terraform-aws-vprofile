resource "aws_security_group" "vprofile-bean-elb-sg" {
    name = "vprofile-bean-elb-sg"
    description = "Security group for bean-elb"
    vpc_id = "module.vpc_id"
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0.0/0"]
    }

    ingress {
         from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0.0/0"]
    }
}

resource "aws_security_group" "vprofile-bastion-sg" {
    name        = "vprofile-bastion-sg"
    description = "Security group for bastionisioner ec2 instance_count
    vpc_id      = module.vpc.vpc_id
     egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0.0/0"]
    }
    ingress {
         from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = [var.MYIP]
    }
}

resource "aws_security_group" "vprofile-prod-sg" {
    name        = "vprofile-prod-sg"
    description = "aws_security_group for beanstalk instance"
    vpc_id      = module.vpc.vpc_id
    egress {
       from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0.0/0"]
    } 
    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = [aws_security_group.vprofile-bastion-sg.de]
    }   
}

resource "aws_security_group" "vprofile-backenend-sg" {
    name        = "vprofile-backend-sg"
    description = "aws_security_group for RDS, active mq,elastic cache"
    vpc_id      = module.vpc.vpc_id
    egress {
       from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0.0/0"]
    } 
    ingress {
        from_port = 22
        protocol = "-1"
        to_port = 22
        cidr_blocks = [aws_security_group.vprofile-prod-sg.id]
    }   
}

resource "aws_security_group_rule" sec_group_allow_itself"{
    type                     = "ingress"
    from_port                = 0
    to_port                  = 65535
    protocol                 = "tcp"
    security_group_id        = aws_security_group.vprofile-backend-sg.id
    source_security_group_id = aws_security_group.vprofile-backend-sg.id
}
    



