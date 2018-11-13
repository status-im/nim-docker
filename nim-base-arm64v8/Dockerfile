FROM arm64v8/debian:stable-slim
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
COPY ./bootstrap.sh ./
COPY ./qemu-aarch64-static /usr/bin/
RUN sh ./bootstrap.sh
