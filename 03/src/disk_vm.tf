resource "yandex_compute_disk" "diskVM" {
  count      = 3
  name       = "disk-${count.index + 1}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 1
  block_size = 4096
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.diskVM[*].id)
    content {
      disk_id     = secondary_disk.key
      auto_delete = true
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.ssh_keys_port
}
