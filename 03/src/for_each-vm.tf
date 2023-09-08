resource "yandex_compute_instance" "eachvm" {

  for_each = local.vm

  name        = each.value.vm_name
  platform_id = "standard-v1"
  resources {
    cores         = each.value.vm_cpu
    memory        = each.value.vm_ram
    core_fraction = each.value.vm_core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.vm_disk
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = local.ssh_keys_port

  depends_on = [
  yandex_compute_instance.web]

}
