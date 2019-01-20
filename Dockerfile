FROM ubuntu
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install git build-essential libreadline-dev zlib1g-dev bison flex -y && \
    git clone https://github.com/mkopec3/postgres-pth.git /usr/local/src/postgres-pth && \
    cd /usr/local/src/postgres-pth/ && \
    ./configure --prefix=/ && \
    make -j`nproc` -C src/interfaces/ install && \
    make -j`nproc` -C src/bin/ install && \
    cd && rm -rf /usr/local/src/postgres-pth/ && \
    apt-get remove --purge git build-essential zlib1g-dev bison flex -y && \
    apt-get autoremove -y && \
    apt-get clean
ENTRYPOINT [ "psql" ]
CMD ["--version"]
