#!/bin/bash
set -e
source /thr_build/buildconfig
set -x

# Install scripts commonly used during setup.
$minimal_apt_get_install curl wget tar zip unzip \
    git rsync tzdata gpg-agent supervisor libxml2 \
    libxslt1-dev libvorbis-dev
