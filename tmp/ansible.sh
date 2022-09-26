#!/bin/bash

[[ ! -d /etc/ansible ]] && mkdir -p /etc/ansible

# edit /etc/ansible/hosts and add
# [control]
# pi0   ansible_connection=local    var_hostname=pi4b0
# [workers]
# pi1   ansible_connection=ssh      var_hostname=pi4b1
# [cluster:children]
# control
# workers

ansible cluster --become -m shell -a "hostnamectl set-hostname {{ var_hostname }}"
ansible cluster --become -m shell -a "hostnamectl status"
