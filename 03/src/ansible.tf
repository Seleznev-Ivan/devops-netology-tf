resource "local_file" "VM_hosts_conf" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.web
      databases  = yandex_compute_instance.eachvm
      storage    = [yandex_compute_instance.storage]
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}
