#Environment to precise whe applying
variable "env" {
}

#The CDIR definition of differents environments
variable "cidr_vpc" {
  type= "map"
  default= {
     dev="10.10.0.0/16"
     test="172.10.0.0/16"
     prod="192.10.0.0/16"
  }
}

#Architecture of differents subnets
variable "subnets" {
   default={
     dev={
	private="10.10.1.0/24"
	public="10.10.2.0/24"
     }
     test={
	private="172.10.1.0/24"
	public="172.10.2.0/24"
     }
     prod={
	private="192.10.1.0/24"
	public="192.10.2.0/24"
     }
   }
}
