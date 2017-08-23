#!/usr/bin/env bash

# Travis CI timeout workaround
[ -n "$TRAVIS" ] && while true; do echo "..."; sleep 60; done &

df -h
fio ./io-test.fio
cd byte-unixbench-5.1.3/UnixBench ; ./Run

# Travis CI timeout workaround
[ -n "$TRAVIS" ] && kill %1
