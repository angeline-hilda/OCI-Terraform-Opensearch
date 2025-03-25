

################################
#  VM Instances based on count #
################################

resource "oci_core_instance" "vms" {
  count = var.instance_count

  // If no explicit AD number, spread instances on all ADs in round-robin. Looping to the first when last AD is reached
  availability_domain = local.AD
  compartment_id      = var.compute_compartment_id
  display_name        = "${var.display_name}-${count.index + 1}"
  shape               = var.shape
  fault_domain        = data.oci_identity_fault_domains.fds.fault_domains[count.index].name
  shape_config {
    memory_in_gbs             = var.memory_in_gbs
    ocpus                     = var.ocpus
  }
  create_vnic_details {
    subnet_id              = var.subnet_id
    display_name           = var.display_name
    assign_public_ip       = var.subnet_type == true ? false : true
    #nsg_ids     = var.nsg_id
  }

  source_details {
    source_type             = "image"
    source_id               = var.image_id
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    #kms_key_id  = var.kms_key_id
  }
 metadata = {
  ssh_authorized_keys = var.ssh_authorized_keys
  user_data = data.cloudinit_config.redis_setup.rendered

}
}


   /* 
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    user_data           = base64encode(<<-EOT
    #!/bin/bash
    # Update and install required dependencies
    sudo apt update -y
    sudo apt install -y build-essential tcl wget openssl libssl-dev

    # Install Redis CLI with TLS support
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable

    # Build Redis CLI with TLS support
    make distclean
    make redis-cli
    make BUILD_TLS=yes
    sudo cp src/redis-cli /usr/local/bin/
    sudo chmod +x /usr/local/bin/redis-cli

    # Verify Redis CLI installation
    redis-cli -v

    # Install RedisInsight
    cd ~
    wget https://downloads.redisinsight.redislabs.com/latest/RedisInsight-linux64.tar.gz
    tar -xvzf RedisInsight-linux64.tar.gz
    sudo mv redisinsight /usr/local/bin/
    sudo chmod +x /usr/local/bin/redisinsight

    # Start RedisInsight in the background
    nohup /usr/local/bin/redisinsight > /dev/null 2>&1 &

    echo "Installation completed. Redis CLI and RedisInsight are ready to use!"

    EOT
    )*/
    /*
    user_data = base64encode(<<-EOT
      #!/bin/bash
      if [ "${ tostring(var.install_postgresql_client)}" = "true" ]; then
        sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
        sudo dnf -qy module disable postgresql
        sudo dnf install -y postgresql16
      fi

    

    # Install Redis CLI if required
      if [ "${tostring(var.install_redis_cli)}" = "true" ]; then
        wget http://download.redis.io/redis-stable.tar.gz
        tar xvzf redis-stable.tar.gz
        cd redis-stable
        make redis-cli
        make BUILD_TLS=yes
        sudo cp src/redis-cli /usr/local/bin/
        cd ..
        rm -rf redis-stable redis-stable.tar.gz
      fi
    EOT
    )
    */
  