FROM bitwalker/alpine-elixir:1.6.5


# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT=2018-05-10 \
    # Set this so that CTRL+G works properly
    TERM=xterm


# Install NPM
RUN \
    mkdir -p /opt/app && \
    mkdir -p /opt/hex && \
    mkdir -p /opt/mix && \
    chmod -R 777 /opt/app && \
    chmod -R 777 /opt/hex && \
    chmod -R 777 /opt/mix && \
    apk update && \
    apk --no-cache --update add \
      git make g++ wget curl inotify-tools \
      nodejs nodejs-npm && \
    npm install npm -g --no-progress && \
    update-ca-certificates --fresh && \
    rm -rf /var/cache/apk/*

# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH \
    MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    HOME=/opt/app

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force


EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod

WORKDIR /opt/app

USER default

#CMD ["mix", "phx.server"]
