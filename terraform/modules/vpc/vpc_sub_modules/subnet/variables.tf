variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "vpc_name" {
    description = "VPC Name"
    type = string
}

variable "subnet_cidr_block" {
    description = "CIDR Block for Subnet"  
    type = string
}

variable "subnet_az" {
    description = "Availability Zone for Subnet"
    type = string
}

variable "number_of_az" {
    description = "Number of Availability Zones"
    type = number  

    validation {
        condition = var.number_of_az >= 1 && var.number_of_az <= 3
        error_message = "Number of AZs must be between 1 and 3"
    } 
}

variable "subnet_type" {
    description = "Subnet Type: 'Public' or 'Private'"
    type = string

    validation {
      condition = contains(["public","private"], var.subnet_type)
      error_message = "Subnet Type should be either 'public' or 'private'"
    }
}

variable "gateway_id" {
    description = "Internet Gateway ID required for public subnet"
    type = string
    default = "" 
}

variable "number_of_subnets" {
    description = "Number of Subnets to Create"
    type = number 

    validation {
      condition = contains([0,1,2,3,4,6], var.number_of_subnets)
      error_message = "Number of Subnets must be one of: 0, 1, 2, 3, 4 or 6"
    }
}

