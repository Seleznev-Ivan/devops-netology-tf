locals {
  vm = {
    "vm1" = { vm_name = "main", vm_cpu = 2, vm_ram = 2, vm_disk = 12, vm_core_frac = 5 },
    "vm2" = { vm_name = "replica", vm_cpu = 2, vm_ram = 3, vm_disk = 20, vm_core_frac = 20 }
  }

  ssh_keys_port = {
    ssh-keys           = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    serial-port-enable = 1
  }
}
