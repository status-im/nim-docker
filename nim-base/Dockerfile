FROM statusteam/debian-pre-nim
MAINTAINER Yuriy Glukhov <iurii@status.im>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
RUN git clone https://github.com/status-im/nim.git \
    && cd nim \
    && sh build_all.sh \
    && echo echo nim version: $(git rev-parse HEAD) > /onStart.d/005-nim-version.sh \
    && chmod +x /onStart.d/005-nim-version.sh \
    && cd ./dist/nimble \
    && echo echo nimble version: $(git rev-parse HEAD) > /onStart.d/006-nimble-version.sh \
    && chmod +x /onStart.d/006-nimble-version.sh \
    && cd ../.. \
    && rm -rf $HOME/.cache/nim ./csources ./dist ./.git \
    && cd ..
