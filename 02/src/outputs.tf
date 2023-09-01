output "external_ip_1_web" {
  value       = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "external ip web"
}

output "external_ip_2_db" {
  value       = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
  description = "external ip db"
}
