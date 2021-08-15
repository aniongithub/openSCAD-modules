FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

# nvidia docker runtime env
ENV NVIDIA_VISIBLE_DEVICES \
        ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility,video

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash &&\
	apt-get update && apt-get install -y --no-install-recommends \
	curl \
	ca-certificates \
	git \
	git-lfs \
	build-essential \
	xclip \
	openscad &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.local/share /.local/share