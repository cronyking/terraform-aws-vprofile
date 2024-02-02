variable AWS_REGION {
    default = "us-east-2"
}

variable AMIS {
    type = map
    default = {
        us-east-2 = "ami-0866a04d72a1f5479"
        us-east-1 = "ami-0c7217cdde317cfec"
        us-west-1 = "ami-0ce2cb35386fc22e9"
    }
}

variable PRIV_PATH {
    default = "vprofilekey"
}

variable PUB_KEY_PATH {
    default = "vprofilekey.pub"
}

variable USERNAME {
    default = ubuntu
}

variable MYIP {
    default = "101.188.67.134/32"
}

variable rmquser {
    default = "rabbit"
}
variable rmqpass {
    default = "Gr33n@apple123456"
}

variable dbUser {
    default = "admin"
}

variable dbpass {
    default = "admin123"
}

variable dbname{
    default = "accounts"
}

variable instance_count {
    default = "1"
}

variable VPC_NAME {
    default = "vprofile-VPC"
}

variable ZONE1 {
    default = "us-east-2a"
}

variable ZONE2 {
    default = "us-east-2b"
}

variable ZONE3 {
    default = "us-east-2c"
}

variable VpcCIDR {
    default = "172.21.0.0/16"
}

variable VpcCIDR {
    default = "172.21.0.0/16"
}

variable PubSub1CIDR {
    default = "172.21.1.0/24"
}

variable PubSub2CIDR {
    default = "172.21.2.0/24"
}

variable PubSub3CIDR {
    default = "172.21.3.0/24"
}

variable PrivSub1CIDR {
    default = "172.21.4.0/24
}

variable PrivSub2CIDR {
    default = "172.21.5.0/24
}

variable PrivSub3CIDR {
    default = "172.21.6.0/24
}




