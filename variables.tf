variable "region-name" {
    description = "making region a variable"
    default = "eu-west-2"
    type = string  
}

variable "cidr-for-vpc" {
    description = "the cidr-for-vpc"
    default = "10.0.0.0/16"
    type = string  
}

variable "cidr-for-public-sub1" {
    description = "Public sub 1 cidr"
    default = "10.0.1.0/24"
    type = string  
}

variable "cidr-for-public-sub2" {
    description = "Public sub 2 cidr"
    default = "10.0.2.0/24"
    type = string  
}

variable "cidr-for-private-sub1" {
    description = "Private sub 1 cidr"
    default = "10.0.3.0/24"
    type = string  
}

variable "cidr-for-private-sub2" {
    description = "Private sub 2 cidr"
    default = "10.0.4.0/24"
    type = string  
}

variable "Pulic-sub1-availability-zone" {
    description = "Making Public Sub1 availability zone a variable"
    default = "eu-west-2a"
    type = string  
}

variable "Pulic-sub2-availability-zone" {
    description = "Making Public Sub2 availability zone a variable"
    default = "eu-west-2b"
    type = string  
}

variable "Private-sub1-availability-zone" {
    description = "Making Private Sub1 availability zone a variable"
    default = "eu-west-2c"
    type = string  
}

variable "Private-sub2-availability-zone" {
    description = "Making Private Sub1 availability zone a variable"
    default = "eu-west-2a"
    type = string  
}

variable "ami" {
    description = "ami of the EC2"
    default = "ami-0be590cb7a2969726"
    type = string  
}

variable "EC2-instance-type" {
    description = "EC2 instance type"
    default = "t2.micro"
    type = string  
}

variable "Test-server1-key-name" {
    description = "Key name for Test Server1"
    default = "Test1"
    type = string  
}

variable "Test-server2-key-name" {
    description = "Key name for Test Server2"
    default = "ABC-kp"
    type = string  
}

variable "ingress-HTTP-port" {
    description = "From and to HTTP port"
    default = "80"
    type = string  
}

variable "ingress-SSH-port" {
    description = "From and to SSH port"
    default = "22"
    type = string  
}

variable "egress-port" {
    description = "From and to egress port"
    default = "0"
    type = string  
}

variable "ingress-protocol" {
    description = "Ingress protocol"
    default = "tcp"
    type = string  
}

variable "egress-protocol" {
    description = "Egress protocol"
    default = "-1"
    type = string  
}




