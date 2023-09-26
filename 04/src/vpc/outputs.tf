output "vpc_id" {
  value = yandex_vpc_network.net_name.id
  #description = "network"
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet_name.id
  #description = "subnet "
}
