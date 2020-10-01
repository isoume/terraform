variable "intance_type" {

default = "t2.micro"
}

variable "nacl" {

type = "list"

default = ["nacl1", "nacl2"]
}
