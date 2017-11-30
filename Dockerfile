FROM buildpack-deps:jessie

RUN set -ex; \
        groupadd --gid 1000 node; \
        useradd --uid 1000 --gid node --shell /bin/bash --create-home node; \
        \
        git clone https://github.com/facebook/watchman.git; \
        cd watchman; \
        git checkout v4.9.0; \
        ./autogen.sh; \
        ./configure --without-python; \
        make; \
        make install; \
        cd ..; \
        rm -Rf watchman

USER node
ENV HOME /home/node
WORKDIR $HOME

ENV NODE_VERSION v6.12.0
ENV NVM_DIR $HOME/.nvm

RUN env; mkdir -p ${NVM_DIR}
COPY ./nvm.sh .

RUN set -ex; \
  [ -s "${HOME}/nvm.sh" ] && . "${HOME}/nvm.sh"; \
  nvm install --lts=boron

ENV NVM_BIN ${NVM_DIR}/versions/node/${NODE_VERSION}/bin
ENV PATH ${NVM_BIN}:${PATH}

CMD ["bash"]
