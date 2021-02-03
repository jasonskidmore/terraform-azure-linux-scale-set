variable "name" {
  description = "The name of the set"
  default = "demo-linux-vm-set"
}

variable "network_interface" {
  description = "The network interface to use"
  type = map(any)
  default = {
    name = "demo"
  }
}

variable "tags" {
  description = "The tags to add to the set"
  type = map(any)
  default = {
    costcenter = "777747",
    client = "demo"
  }
}
