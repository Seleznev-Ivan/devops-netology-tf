###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "ssh" {
  type = map(any)
  default = {
    serial-port-enable = 1
    ssh-keys           = "centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH2VIf95p/dXoynEMlUCEd74TM0AY/SC07/Q4iT+UzNm eddsa-key-20230830"
  }
}

variable "vm_web_imagefamily" {
  type    = string
  default = "ubuntu-2004-lts"
}
