#!/bin/bash
set -e
source /thr_build/buildconfig
set -x

apt-get clean
rm -rf /var/lib/apt/lists/*

rm -rf /tmp/tmp*
