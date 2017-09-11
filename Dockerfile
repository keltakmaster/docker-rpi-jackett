FROM kdautrey/rpi-mono
MAINTAINER keltakmaster

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

# install jackett
RUN \
  mkdir -p \
	/app/Jackett && \
 curl -o \
 /tmp/jacket.tar.gz -L \
	https://github.com/Jackett/Jackett/releases/download/v0.8.59/Jackett.Binaries.Mono.tar.gz && \
 tar xf \
 /tmp/jacket.tar.gz -C \
	/app/Jackett --strip-components=1

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /downloads
EXPOSE 9117

ENTRYPOINT ["mono", "/app/Jackett/JackettConsole.exe"]
