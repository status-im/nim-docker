FROM arm32v7/debian:stable-slim
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
RUN while ! apt-get update; do true; done \
    && while ! apt-get install -y gcc g++ make git libssl-dev wget; do true; done \
    && apt-get autoremove -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man \
    && rm -rf /usr/share/locale \
    && wget https://github.com/facebook/rocksdb/archive/v5.14.2.tar.gz \
    && tar xvf v5.14.2.tar.gz \
    && cd rocksdb-5.14.2 && make install-shared -j4 && cd .. \
    && rm -rf rocksdb-5.14.2 v5.14.2.tar.gz \
    && git clone https://github.com/status-im/nim.git \
    && cd nim \
    && sh build_all.sh \
    && rm -rf $HOME/.cache/nim ./csources ./dist ./.git \
    && cd ..
