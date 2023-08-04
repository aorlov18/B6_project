data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2004-lts"
}
data "yandex_compute_image" "centos_image" {
  family = "centos-stream-8"
}

resource "yandex_compute_instance" "vm-test1" {
  name                      = "vm1"
  allow_stopping_for_update = true
  hostname                  = "vm1"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    user-data = "${file("../meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_compute_instance" "vm-test2" {
  name                      = "vm2"
  allow_stopping_for_update = true
  hostname                  = "vm2"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    user-data = "${file("../meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_compute_instance" "vm-test3" {
  name                      = "vm3"
  allow_stopping_for_update = true
  hostname                  = "vm3"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    user-data = "${file("../meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_vpc_network" "network_terraform" {
  name = "network_terraform"
}

resource "yandex_vpc_subnet" "subnet_terraform" {
  name           = "subnet_terraform"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network_terraform.id
  v4_cidr_blocks = ["192.168.15.0/24"]
}
