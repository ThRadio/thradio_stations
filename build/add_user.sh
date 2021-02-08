#!/bin/bash
set -e
source /thr_build/buildconfig
set -x  

apt-get update

$minimal_apt_get_install sudo

# Workaround for sudo errors in containers, see: https://github.com/sudo-project/sudo/issues/42
echo "Set disable_coredump false" >>/etc/sudo.conf

adduser --home /var/thradio --disabled-password --gecos "" thradio

chown -R thradio:thradio /var/thradio

echo 'thradio ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
