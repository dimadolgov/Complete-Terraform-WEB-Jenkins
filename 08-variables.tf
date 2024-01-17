######################## Project TAG ########################
variable "project_name" {
  default = "NICE"
}

######################## Network ########################
variable "vpc_cidr_block" {
  description = "cidr block for the vpc"
  default     = "10.10.10.0/24"
}
variable "public_subnet_cidr" {
  default = "10.10.10.0/24"
}

################## EC2 ##################
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "ami" {
  type    = string
  default = "ami-0f57fcd358b56d855"
}

################## Security Group ##################
variable "dynamic_ingress_description" {
  type    = string
  default = "Allow WEB from ANY"
}
variable "dynamic_ingress_ports" {
  type    = list(any)
  default = ["80", "22"]
}
variable "dynamic_ingress_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

