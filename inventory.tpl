[owncloud]
${owncloud_ip}

[owncloud:vars]
ansible_user=${owncloud_keypublic}
ansible_ssh_private_key_file=${owncloud_user}
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
