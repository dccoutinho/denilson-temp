output "ip" {
  value = "${aws_instance.owncloud.public_ip}"
}
