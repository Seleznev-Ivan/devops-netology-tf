

###my vars VM2
variable "vm_db_imagefamily" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_platformname" {
  type    = string
  default = "platform-db"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v1"
}

/*
variable "vm_db_cores" {
  type    = number
  default = 2
}

variable "vm_db_memory" {
  type    = number
  default = 2
}

variable "vm_db_core_fraction" {
  type    = number
  default = 20
}
*/
