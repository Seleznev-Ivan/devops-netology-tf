terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

#создаем облачную сеть
resource "yandex_vpc_network" "net_name" {
  name = "var.env_name"
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet_name" {
  name           = "${var.env_name}-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.net_name.id
  v4_cidr_blocks = [var.cidr]
}
