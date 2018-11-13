FROM arm32v7/debian:stable-slim
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
COPY ./bootstrap.sh ./
COPY ./qemu-arm-static /usr/bin/
RUN sh ./bootstrap.sh
