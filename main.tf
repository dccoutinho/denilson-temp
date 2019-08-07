 resource "aws_key_pair" "chave-SSH" {
  key_name = "${var.key_name}"
  public_key = "${file("${var.keypublic_path}")}"

 }

resource "aws_instance" "owncloud" {
  ami             = "${data.aws_ami.ubuntu-18_04.id}"
  instance_type   = "${var.instance_type}"
  key_name = "${aws_key_pair.chave-SSH.key_name}"
  vpc_security_group_ids = ["${aws_security_group.owncloud.id}"]


}
