data "template_file" "inventory" {
    template = "${file("inventory.tpl")}"

    vars {
        owncloud_ip = "${aws_instance.owncloud.public_ip}"
        owncloud_keypublic = "${var.key_path}"
        owncloud_user = "${var.linux_user}"
    }
}

resource "null_resource" "update_inventory" {

    triggers {
        template = "${data.template_file.inventory.rendered}"
    }

    provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ./ansible/inventory"
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i './ansible/inventory' './ansible/owncloud.yml'"

      }
}
