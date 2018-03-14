FROM statusteam/debian-pre-nim
MAINTAINER Yuriy Glukhov <iurii@status.im>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
RUN git clone https://github.com/nim-lang/nim.git \
    && cd nim \
    && git remote add statusim https://github.com/status-im/nim.git \
    && git fetch statusim \
    && git config --global user.email "you@example.com" \
    && git config --global user.name "Your Name" \
    && for b in $(git branch -a --list 'statusim/status-autopatch-*'); do git merge $b; done \
    && git clone --depth 1 https://github.com/nim-lang/csources.git \
    && cd csources \
    && sh build.sh \
    && cd .. \
    && nim c koch \
    && ./koch boot -d:release \
    && ./koch nimble \
    && echo echo nim version: $(git rev-parse HEAD) > /onStart.d/005-nim-version.sh \
    && chmod +x /onStart.d/005-nim-version.sh \
    && cd ./dist/nimble \
    && echo echo nimble version: $(git rev-parse HEAD) > /onStart.d/006-nimble-version.sh \
    && chmod +x /onStart.d/006-nimble-version.sh \
    && cd ../.. \
    && rm -rf ./nimcache ./compiler/nimcache ./csources ./dist ./.git \
    && cd ..
