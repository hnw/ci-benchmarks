#!/usr/bin/env bash

# Travis CI timeout workaround
[ -n "$TRAVIS" ] && while true; do echo "..."; sleep 60; done &

df -h

if [[ $TEST == "fio"  ]]; then
    fio ./io-test.fio
fi

if [[ $TEST == "UnixBench1"  ]]; then
    cd byte-unixbench-5.1.3/UnixBench ; ./Run -i 8 -c 1
fi

# 0: numCpus
if [[ $TEST == "UnixBench0"  ]]; then
    cd byte-unixbench-5.1.3/UnixBench ; ./Run -i 8 -c 0
fi

# Travis CI timeout workaround
[ -n "$TRAVIS" ] && kill %1
