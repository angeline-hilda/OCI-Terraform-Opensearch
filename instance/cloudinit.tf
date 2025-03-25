data "cloudinit_config" "redis_setup" {
  gzip          = false
  base64_encode = true
  part {
  filename     = "redis-init.sh"
  content_type = "text/x-shellscript"
  content      = <<-EOT
    #!/bin/bash
    set -e  # Exit immediately if any command fails

    # Update and install dependencies
    sudo dnf update -y
    sudo dnf install -y gcc make tcl wget openssl-devel tar

    # Install Redis CLI with TLS support
    cd /tmp
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    make distclean
    make redis-cli BUILD_TLS=yes
    sudo cp src/redis-cli /usr/local/bin/
    sudo chmod +x /usr/local/bin/redis-cli

    # Ensure redis-cli is in PATH
    echo 'export PATH=$PATH:/usr/local/bin' | sudo tee -a /etc/profile.d/custom_path.sh
    source /etc/profile.d/custom_path.sh

    # Verify Redis CLI installation
    if ! redis-cli -v; then
      echo "Redis CLI installation failed!" | sudo tee -a /var/log/cloud-init.log
      exit 1
    fi

    echo "Redis completed successfully!" | sudo tee -a /var/log/cloud-init.log
  EOT
}    
}

resource "null_resource" "wait_for_cloud_init" {
    depends_on = [oci_core_instance.vms]
    for_each = { for idx, vm in oci_core_instance.vms : idx => vm }

  connection {
    type        = "ssh"
    user        = "opc"
    private_key = var.ssh_private_key
    host        = each.value.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "sudo cloud-init status --wait",
      "echo 'Cloud-init completed successfully!'"
    ]
  }

}
