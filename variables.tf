variable "intance_type" {

default = "t2.micro"
}

variable "nacl" {

type = "list"

default = ["nacl1", "nacl2"]
}

variable "env_vpc" {
  type = "map"
  default = {
    "dev" = "vpc-dev"
    "prod" = "vpc-prod"
    "test" = "vpc-test"
  }
}
