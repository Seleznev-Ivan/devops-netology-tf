resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_imagefamily
}
resource "yandex_compute_instance" "platform" {
  name        = "${local.org}-${local.env}-${var.vm_web_platformname}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_resources["cores"]
    memory        = var.vm_web_resources["memory"]
    core_fraction = var.vm_web_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = var.ssh
}
/*
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
*/


resource "yandex_compute_instance" "platform2" {
  name        = "${local.org}-${local.env}-${var.vm_db_platformname}"
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vm_db_resources["cores"]
    memory        = var.vm_db_resources["memory"]
    core_fraction = var.vm_db_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = var.ssh
}

/*
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
*/
