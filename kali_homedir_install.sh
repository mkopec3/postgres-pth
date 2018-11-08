#!/bin/bash
CPUS=`nproc`
INSTALL_DIR=$HOME/psql-pth

cd && git clone https://github.com/mkopec3/postgres-pth.git && \
cd postgres-pth && ./configure --prefix=$INSTALL_DIR && \
make -j$CPUS -C src/bin/ install
make -j$CPUS -C src/interfaces/ install
